using SE1436_Group4_Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class Income : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetMonth();
                GetYear();
            }
        }
        public void GetMonth()
        {
            List<int> list = new List<int>();
            for(int i = 1; i <= 12; i++)
            {
                ddlMonth.Items.Add(i + "");
            }
        }
        public void GetYear()
        {
            List<int> list = new List<int>();
            for (int i = 2005; i <= 2030; i++)
            {
                ddlYear.Items.Add(i + "");
            }
        }

        public void LoadDataToGv()
        {
            string month = Convert.ToString(ddlMonth.SelectedValue.ToString());
            string year = Convert.ToString(ddlYear.SelectedValue.ToString());
            Gv2.DataSource = SanPhamDAO.GetAllDonHangByMonth(month, year);
            GvProduct.DataSource = SanPhamDAO.GetIncomeByMonth(month, year);
            GvProduct.DataBind();
            Gv2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LoadDataToGv();
        }

        protected void Gv2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvProduct.PageIndex = e.NewPageIndex;
            LoadDataToGv();
        }
    }
}