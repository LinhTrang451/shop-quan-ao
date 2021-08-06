using SE1436_Group4_Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSingup_Click(object sender, EventArgs e)
        {
            string tk = txtUsername.Text;
            string mk = txtPass.Text;
            string hoten = txtName.Text;
            bool gender = true ? rdbMale.Checked : rdbFemale.Checked;
            DateTime date = Convert.ToDateTime(txtDate.Text);
            string diachi = txtAddress.Text;
            string sdt = txtSdt.Text;
            SanPhamDAO.InserNguoiDung(tk, mk, hoten, gender, date, diachi, sdt);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Create Success')", true);
            Response.Redirect("Login.aspx");
        }
    }
}