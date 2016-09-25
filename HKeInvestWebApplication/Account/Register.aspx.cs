using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using HKeInvestWebApplication.Models;
using HKeInvestWebApplication.Code_File;
using HKeInvestWebApplication.ExternalSystems.Code_File;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Windows.Forms;
using System.Globalization;

namespace HKeInvestWebApplication.Account
{
    public partial class Register : Page
    {
        HKeInvestData theData = new HKeInvestData();
        private void AddUserName(string userName, string accountNumber)
        {
            HKeInvestData myHKeInvestData = new HKeInvestData();

            SqlTransaction trans = myHKeInvestData.beginTransaction();

            myHKeInvestData.setData("update[Account] set[userName] = '" + 
            userName +"' " + "where [accountNumber]= '" + accountNumber + "'", trans);

            myHKeInvestData.commitTransaction(trans);
        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) {
                if (isValidClient() == false)
                {
                    ErrorMessage.Text = "Information entered cannot be matched with an existing client";
                    return;
                } 
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = UserName.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                //Assign Client Role
                IdentityResult roleResult = manager.AddToRole(user.Id, "Client");
                //Update UserName in Account Table
                AddUserName(UserName.Text.Trim(), AccountNumber.Text.Trim());

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
            }

        }

        //To check the account number
        protected void cvAccountNumber_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
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

        private Boolean isValidClient()
        {
            DataTable clientDt = theData.getData("Select firstName, lastName, dateOfBirth, email, HKIDPassportNumber, accountNumber, building, street, district, homePhone, homeFax, businessPhone, mobilePhone, countryOfCitizenship, countryOfLegalResidence, passportCountryOfIssue, employmentStatus, occupation, yearsWithEmployer, employerName, employerPhone, natureOfBusiness, employedByFinanceInst, memberPublicTradedInst, primarySourceOfFunds, investmentObjective, investmentKnowledge, annualIncome, approxLiquidNetWorth, sweep from ClientTemp where accountNumber='" + AccountNumber.Text.Trim() + "';");
            String colName = "";
            String colValue = "";
            Boolean checkFailed = false;

            String MyString = DateOfBirth.Text.Trim(); // get value from text field
            DateTime MyDateTime = new DateTime();
            //MyDateTime = DateTime.Parse(MyString);
            MessageBox.Show(MyString);
            //String newDateOfBirth = MyDateTime.ToString("MM/dd/yyyy"); //add MyString_new

            MyDateTime = DateTime.ParseExact(DateOfBirth.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            String theBdate = MyDateTime.ToShortDateString();

            foreach (DataColumn col in clientDt.Columns)
            {
                colName = col.ColumnName.Trim();
                colValue = clientDt.Rows[0][col].ToString().Trim();

                switch (colName)
                {
                    case ("firstName"):
                        if (!colValue.Equals(FirstName.Text.Trim())) { checkFailed = true; MessageBox.Show("firstName failed"); }
                        break;
                    case ("lastName"):
                        if (!colValue.Equals(LastName.Text.Trim())) { checkFailed = true; MessageBox.Show("lastName failed"); }
                        break;
                    case ("dateOfBirth"):
                        MyDateTime = DateTime.Parse(colValue);
                        colValue = MyDateTime.ToShortDateString();
                        if (!colValue.Equals(theBdate.Trim()))
                        {
                            checkFailed = true;
                            MessageBox.Show("dateOfBirth failed..." + colValue + "...." + theBdate);
                        }
                        break;
                    case ("email"):
                        if (!colValue.Equals(Email.Text.Trim())) { checkFailed = true; MessageBox.Show("email failed"); }
                        break;
                    case ("HKIDPassportNumber"):
                        if (!colValue.Equals(HKID.Text.Trim())) { checkFailed = true; MessageBox.Show("HKIDPass failed"); }
                        break;
                    case ("accountNumber"):
                        if (!colValue.Equals(AccountNumber.Text.Trim())) { checkFailed = true; MessageBox.Show("accountNum failed"); }
                        break;
                    case ("building"):
                        break;
                    case ("street"):
                        if (!colValue.Equals(Street.Text.Trim())) { checkFailed = true; MessageBox.Show("street failed"); }
                        break;
                    case ("district"):
                        if (!colValue.Equals(District.Text.Trim())) { checkFailed = true; MessageBox.Show("districtText failed"); }
                        break;
                    case ("homePhone"):
                        if (!colValue.Equals(HomePhone.Text.Trim())) { checkFailed = true; MessageBox.Show("homePhone failed"); }
                        break;
                    case ("homeFax"):
                        if (!colValue.Equals(HomeFax.Text.Trim())) { checkFailed = true; MessageBox.Show("homeFax failed"); }
                        break;
                    case ("businessPhone"):
                        if (!colValue.Equals(BusinessPhone.Text.Trim())) { checkFailed = true; MessageBox.Show("businessPhone failed"); }
                        break;
                    case ("mobilePhone"):
                        if (!colValue.Equals(MobilePhone.Text.Trim())) { checkFailed = true; MessageBox.Show("mobilePhone failed"); }
                        break;
                    case ("countryOfCitizenship"):
                        if (!colValue.Equals(CountryOfCitizenship.Text.Trim()))
                        {
                            checkFailed = true;

                            MessageBox.Show("countryOfCitizen failed" + colValue + "..." + CountryOfCitizenship.Text.ToString());
                            MessageBox.Show(colValue.Equals(CountryOfCitizenship.Text.ToString().Trim()).ToString());
                        }
                        break;
                    case ("countryOfLegalResidence"):
                        if (!colValue.Equals(CountryOfLegalResidence.Text.Trim())) { checkFailed = true; MessageBox.Show("countryLegalRes failed"); }
                        break;
                    case ("passportCountryOfIssue"):
                        if (!colValue.Equals(PassportCountryOfIssue.Text.Trim())) { checkFailed = true; MessageBox.Show("passCountryOfIssue failed"); }
                        break;
                    case ("employmentStatus"):
                        if (!colValue.Equals(ddlEmploymentStatus.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("employmentStatus failed"); }
                        break;
                    case ("occupation"):
                        if (!colValue.Equals(Occupation.Text.Trim())) { checkFailed = true; MessageBox.Show("occupation failed"); }
                        break;
                    case ("yearsWithEmployer"):
                        if (!colValue.Equals(YearsWithEmployer.Text.Trim())) { checkFailed = true; MessageBox.Show("yearsWithEmployer failed"); }
                        break;
                    case ("employerName"):
                        if (!colValue.Equals(EmployerName.Text.Trim())) { checkFailed = true; MessageBox.Show("employerName failed"); }
                        break;
                    case ("employerPhone"):
                        if (!colValue.Equals(EmployerPhone.Text.Trim())) { checkFailed = true; MessageBox.Show("employerPhone failed"); }
                        break;
                    case ("natureOfBusiness"):
                        if (!colValue.Equals(NatureOfBusiness.Text.Trim())) { checkFailed = true; MessageBox.Show("natureOfBusiness failed"); }
                        break;
                    case ("employedByFinanceInst"):
                        if (!colValue.Equals(ddlEmployedByFinanceInst.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("emploeyedByFinanceInst failed"); }
                        break;
                    case ("memberPublicTradedInst"):
                        if (!colValue.Equals(ddlMemberPublicTradedInst.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("memberPublic failed"); }
                        break;
                    case ("primarySourceOfFunds"):
                        if (!colValue.Equals(ddlPrimarySourceOfFunds.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("primarySourceOfFunds failed..." + colValue + "..." + ddlPrimarySourceOfFunds.ToString().Trim()); }
                        break;
                    case ("investmentObjective"):
                        if (!colValue.Equals(ddlInvestmentObjective.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("investmentObjective failed"); }
                        break;
                    case ("annualIncome"):
                        if (!colValue.Equals(ddlAnnualIncome.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("annualIncome failed"); }
                        break;
                    case ("approxLiquidNetWorth"):
                        if (!colValue.Equals(ddlApproxLiquidNetWorth.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("approxLiquidNetWorth failed"); }
                        break;
                    case ("sweep"):
                        if (!colValue.Equals(ddlSweep.SelectedValue.ToString().Trim())) { checkFailed = true; MessageBox.Show("sweep failed"); }
                        break;
                    default:
                        MessageBox.Show("Something weird happened");
                        break;
                }

                if (checkFailed == true)
                {
                    return false;
                }
            }
            return true;

        }
    }
}