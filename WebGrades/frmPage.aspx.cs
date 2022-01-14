using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGrades
{

    public partial class frmPage : System.Web.UI.Page
    {
        public NewGraderInfoService.NewGraderInfoServiceSoapClient NewGraderClient;
        protected void Page_Load(object sender, EventArgs e)
        {
            NewGraderClient = new NewGraderInfoService.NewGraderInfoServiceSoapClient("NewGraderInfoServiceSoap");

            if (Page.IsPostBack)
            {
                lbllogin.Text = "ispostback";
                String token = (String)this.ViewState["Token"];

            }
            else
            {
                this.ViewState["Token"] = "";
                lbllogin.Text = "is first load";
            }
        }

        protected void butLogin_Click(object sender, EventArgs e)
        {
            String attempt = NewGraderClient.logIn(txtUsername.Text, txtPassword.Text, "Teacher");
            if (attempt.StartsWith("ERROR"))
            {
                lbllogin.Text = "Login Failed!";
            }
            else
            {


                lbllogin.Text = "Successful Login!";
                this.ViewState["Token"] = attempt;
            }

        }

        protected void butSearch_Click(object sender, EventArgs e)
        {
            String SID = txtSearch.Text;
            this.ViewState["SID"] = SID;
            NewGraderInfoService.Student currentstudent = NewGraderClient.getStudent(SID, (String)this.ViewState["Token"]);
            lblsearchedStudent.Text = currentstudent.lastname + ", " + currentstudent.firstname + " " + currentstudent.middleinitial + ".";
            ddlclasses.DataSource = currentstudent.studentEnrollments;
            ddlclasses.DataTextField = "COURSENUM";
            ddlclasses.DataValueField = "OFFERINGID";
            ddlclasses.DataBind();

        }

        protected void ddlclasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            String OFFERINGID = ddlclasses.SelectedValue;
            int offeringid = Convert.ToInt32(OFFERINGID);
            this.ViewState["OfferingID"] = offeringid;


        }

        protected void butSubmit_Click(object sender, EventArgs e)
        {
            NewGraderInfoService.StudentClassPerformance scp = NewGraderClient.getStudentClassPerformance((String)this.ViewState["SID"], (int)this.ViewState["OfferingID"], (String)this.ViewState["Token"]);

            gridGradeSummary.Visible = true;
            gridGradeSummary.DataSource = scp.studentGradeSummary;
            gridGradeSummary.DataBind();

            gridgradedetail.Visible = true;
            gridgradedetail.DataSource = scp.studentGrades;
            gridgradedetail.DataBind();
        }
    }
}

