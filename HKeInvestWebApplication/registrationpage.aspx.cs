using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using HKeInvestWebApplication.Code_File;
using System.Diagnostics;
using System.Windows.Forms;
using System.Globalization;

namespace HKeInvestWebApplication
{
    public partial class registrationpage : System.Web.UI.Page
    {

        protected void cvAccountNumber_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string temp = AccountNumber.Text.Trim();
            string LN = LastName.Text.Trim();
            if (LN != "" && temp != "")
            {
                LN = LN.ToUpper();
                //store first two letter from AccountNumber
                char[] arrr;
                arrr = temp.ToCharArray(0, 2);

                //store fist two letter in arr2 from last name
                char[] arr;
                arr = LN.ToCharArray(0, 2);

                if ((arrr[0] == arr[0] && arrr[1] == arr[1]) || (arrr[0] == arr[0] && arrr[1] == arr[0])) { return; }
            }
            args.IsValid = false;
            cvAccountNumber.ErrorMessage = "The account number does not match the client's last name";
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            
            HKeInvestData myHKeInvestData = new HKeInvestData();
            SqlTransaction trans = myHKeInvestData.beginTransaction();

            DateTime MyDateTime = new DateTime();
            MyDateTime = DateTime.ParseExact(DateOfBirth.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture);
            String DOB = MyDateTime.ToShortDateString();


            myHKeInvestData.setData("insert into [Account] ([accountNumber], [accountType],[balance]) values ('" + AccountNumber.Text.Trim() + "', '" + ddlAccountType.SelectedValue.ToString().Trim() +"', '" + balance.Text.Trim() +"' )", trans);
            
            myHKeInvestData.setData("insert into [Client] ([firstName], [lastName],[dateofBirth],[email],[HKIDPassportNumber],[accountNumber],[building],[street],[district],[homePhone],[homeFax],[businessPhone],[mobilePhone],[countryOfCitizenship],[countryOfLegalResidence],[passportCountryOfIssue],[employmentStatus],[occupation],[yearsWithEmployer],[employerName],[employerPhone],[natureOfBusiness],[employedByFinanceInst],[memberPublicTradedInst],[primarySourceOfFunds],[investmentObjective],[investmentKnowledge],[annualIncome],[approxLiquidNetWorth],[sweep]) values ('"
                + FirstName.Text.Trim() + "', '" + LastName.Text.Trim() + "', '" + DOB +"', '" + Email.Text.Trim() + "', '" + HKID.Text.Trim() + "', '" + AccountNumber.Text.Trim() + "', '" + Building.Text.Trim() + "', '" + Street.Text.Trim() + "', '" + District.Text.Trim() + "', '" + HomePhone.Text.Trim() + "', '" + HomeFax.Text.Trim() + "', '" + BusinessPhone.Text.Trim() + "', '" + MobilePhone.Text.Trim() + "', '" + CountryOfCitizenship.Text.Trim() + "', '" + CountryOfLegalResidence.Text.Trim() + "', '" + PassportCountryOfIssue.Text.Trim() + "', '" + ddlEmploymentStatus.SelectedValue.ToString().Trim() + "', '" + Occupation.Text.Trim() + "', '" + YearsWithEmployer.Text.Trim() + "', '" + EmployerName.Text.Trim() + "', '" + EmployerPhone.Text.Trim() + "', '" + NatureOfBusiness.Text.Trim() + "', '" + ddlEmployedByFinanceInst.SelectedValue.ToString().Trim() + "', '" + ddlMemberPublicTradedInst.SelectedValue.ToString().Trim() + "', '" + ddlPrimarySourceOfFunds.SelectedValue.ToString().Trim() + "', '" + ddlInvestmentObjective.SelectedValue.ToString().Trim() + "', '" + ddlInvestmentKnowledge.SelectedValue.ToString().Trim() + "', '" + ddlAnnualIncome.SelectedValue.ToString().Trim() + "', '" + ddlApproxLiquidNetWorth.SelectedValue.ToString().Trim() + "', '" + ddlSweep.SelectedValue.ToString().Trim() + "')", trans);
            
            myHKeInvestData.commitTransaction(trans);


        }
    }
}