using SE1436_Group4_Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class InfoUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataDvInfo();
            }
        }

        public void LoadDataDvInfo()
        {
            string account = (string)Session["user"];
            DvInfo.DataSource = SanPhamDAO.GetUserNameById(account);
            DvInfo.DataBind();
        }
    }
}