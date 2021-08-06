using SE1436_Group4_Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class remove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int aid = Convert.ToInt32(Request.QueryString["aid"]);
            SanPhamDAO.DeleteProduct(aid);
            Response.Redirect(string.Format("ListProduct.aspx"));
        }
    }
}