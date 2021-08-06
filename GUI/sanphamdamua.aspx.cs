using SE1436_Group4_Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class thongtincanhan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataToDdlDate();
                LoadDataDvInfo();
            }
        }

        public void LoadDataDvInfo()
        {
            if(ddlDate.Items.Count <= 0)
            {

            }
            else
            {
                string account = (string)Session["user"];
                DateTime date = Convert.ToDateTime(ddlDate.SelectedValue.ToString().Replace("12:00:00 AM", ""));
                GvProduct.DataSource = SanPhamDAO.GetAllProductByUser(account, date);
                GvProduct.DataBind();
            }
        }
        public void LoadDataToDdlDate()
        {
            string user = (string)Session["user"];
            ddlDate.DataSource = SanPhamDAO.GetDdlDate(user);
            ddlDate.DataTextField = "NgayDatHang";
            ddlDate.DataValueField = "NgayDatHang";
            ddlDate.SelectedIndex = 0;
            ddlDate.DataBind();
        }

        protected void ddlDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDvInfo();
        }
    }
}