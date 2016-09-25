<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registrationpage.aspx.cs" Inherits="HKeInvestWebApplication.registrationpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="error_message">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" DisplayMode="BulletList" EnableClientScript="False" />
    </div>
    <h4>Create a new login account</h4>
<div class="form-horizontal">


         <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="AccountNumber" Text="Account #" CssClass="control-label col-md-2"></asp:Label>
             <div class ="col-md-4">
                 <asp:TextBox ID="AccountNumber" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Account Number is required" ControlToValidate="AccountNumber" EnableClientScript="False" Display="Dynamic" CssClass="text-danger" Text="*"></asp:RequiredFieldValidator> <asp:CustomValidator ID="cvAccountNumber" runat="server" ErrorMessage="The account number does not match with the Client's last name" ControlToValidate="AccountNumber" Text="*" Display="Dynamic" CssClass="text-danger" EnableClientScript="False" ValidateEmptyText="True" OnServerValidate="cvAccountNumber_ServerValidate"></asp:CustomValidator>
             </div>
             <asp:Label runat="server" AssociatedControlID="FirstName" Text="First Name" CssClass="control-label col-md-2"></asp:Label>
             <div class ="col-md-4">
                 <asp:TextBox ID="FirstName" runat="server" CssClass="form-control" MaxLength="35">CHIN KIU</asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="First Name is required" ControlToValidate="FirstName" CssClass="text-danger" Display="Dynamic" EnableClientScript="False" Text="*"></asp:RequiredFieldValidator>
             </div>
         </div>
  
         <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="HKID" Text="HKID/Passport#" CssClass="control-label col-md-2"></asp:Label>
             <div class="col-md-4">
                 <asp:TextBox ID="HKID" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="A HKID or Passport number is required" Display="Dynamic" CssClass="text-danger" EnableClientScript="False" ControlToValidate="HKID" Text="*"></asp:RequiredFieldValidator>
             </div>
             <asp:Label runat="server" AssociatedControlID="LastName" Text="Last Name " CssClass="control-label col-md-2"></asp:Label>
             <div class ="col-md-4">
                 <asp:TextBox ID="LastName" runat="server" CssClass="form-control" MaxLength="35">KWAN</asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Last Name is required" ControlToValidate="LastName" EnableClientScript="False" Display="Dynamic" CssClass="text-danger" Text="*"></asp:RequiredFieldValidator>
             </div>
         </div>


         <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="DateOfBirth" Text="Date of Birth" CssClass="control-label col-md-2"></asp:Label>
             <div class="col-md-4">
                 <asp:TextBox ID="DateOfBirth" runat="server" CssClass="form-control"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Date of Birth is required" Text="*" EnableClientScript="False" ControlToValidate="DateOfBirth" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Date of Birth is not valid" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[/](0?[1-9]|1[012])[/]\d{4}$" Text="*" Display="Dynamic" CssClass="text-danger" EnableClientScript="False" ControlToValidate="DateOfBirth"></asp:RegularExpressionValidator>
             </div>
             <asp:Label runat="server" AssociatedControlID="Email" Text="Email" CssClass="control-label col-md-2"></asp:Label>
             <div class ="col-md-4">
                 <asp:TextBox ID="Email" runat="server" TextMode="Email" CssClass="form-control" MaxLength="30">ckkwanaa@ust.hk</asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email is required" Display="Dynamic" CssClass="text-danger" Text="*" EnableClientScript="False" ControlToValidate="Email"></asp:RequiredFieldValidator>
             </div>
         </div>
         <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="Tittle" Text="Tittle" CssClass="control-label col-md-2"></asp:Label> 
             <div>
                 <asp:RadioButtonList ID="Tittle" runat="server" RepeatDirection="Horizontal" >
                    <asp:ListItem Value="mr">Mr.</asp:ListItem>
                    <asp:ListItem Value="mrs">Mrs.</asp:ListItem>
                    <asp:ListItem Value="ms">Ms.</asp:ListItem>
                    <asp:ListItem Value="dr">Dr.</asp:ListItem>
                 </asp:RadioButtonList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Tittle is required" Text="*" EnableClientScript="False" ControlToValidate="Tittle" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
             <asp:Label runat="server" AssociatedControlID="UserName" Text="User Name" CssClass="control-label col-md-2"></asp:Label>
             <div class="col-md-4">
                 <asp:TextBox ID="UserName" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="User Name is required" Text="*" EnableClientScript="False" ControlToValidate="UserName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="User Name Must contain 6 - 10 characters" Text="*" Display="Dynamic" CssClass="text-anger" EnableClientScript="False" ControlToValidate="UserName" ValidationExpression="^.{6,10}$"></asp:RegularExpressionValidator> <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="User Name must contain only letter and digit" ControlToValidate="UserName" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger" ValidationExpression="^([a-zA-Z0-9]{6,10}?)$"></asp:RegularExpressionValidator>
             </div>
         </div>
         <div class="form-group">
             <asp:Label runat="server" AssociatedControlID="Password" Text="Password" CssClass="control-label col-md-2"></asp:Label>
             <div class="col-md-4">
                 <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Password is required" Display="Dynamic" CssClass="text-danger" Text="*" EnableClientScript="False" ControlToValidate="Password"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Password must contain 8 - 15 characters " ValidationExpression="^.{8,15}$" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger" ControlToValidate="Password"></asp:RegularExpressionValidator> <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Password must contain at least 2 nonalphanumeric characters" ValidationExpression="^(?=.*(\W.*){2,}).*$" EnableClientScript="False" ControlToValidate="Password" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
             </div>

             <asp:Label runat="server" AssociatedControlID="ConfirmPassword" Text="Confirm Password" CssClass="control-label col-md-2"></asp:Label>
             <div class="col-md-4">
                 <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Confirm password is required" EnableClientScript="False" ControlToValidate="ConfirmPassword" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator> <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and confirm password do not match" ControlToCompare="Password" ControlToValidate="ConfirmPassword" EnableClientScript="False" Text="*" Font-Underline="False" CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
             </div>
         </div>
 
            <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlAccountType" CssClass="control-label col-md-2" Text="Account Type"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlAccountType" runat="server" CssClass="form-control" Width="180">
                    <asp:ListItem Value="0">Select Account Type</asp:ListItem>
                    <asp:ListItem>Individual</asp:ListItem>
                    <asp:ListItem>Survivorship</asp:ListItem>
                    <asp:ListItem>Common</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Account Type is required" EnableClientScript="False" ControlToValidate="ddlAccountType" Text="*" Display="Dynamic" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <h4>Personal Information</h4>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CountryOfCitizenship" CssClass="control-label col-md-2" Text="Country of Citizenship"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="CountryOfCitizenship" runat="server" CssClass="form-control" MaxLength="70"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Country of citizenship is required" EnableClientScript="False" ControlToValidate="CountryOfCitizenship" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="PassportCountryOfIssue" CssClass="control-label col-md-2" Text="Passport Country"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="PassportCountryOfIssue" runat="server" CssClass="form-control" MaxLength="70"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Passport Country Of Issue is required" EnableClientScript="False" Text="*" ControlToValidate="PassportCountryOfIssue" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CountryOfLegalResidence" CssClass="control-label col-md-2" Text="Country of Legal Residence"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="CountryOfLegalResidence" runat="server" CssClass="form-control" MaxLength="70"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Country Of Legal Residence is required" ControlToValidate="CountryOfLegalResidence" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="District" CssClass="control-label col-md-2" Text="District"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="District" runat="server" CssClass="form-control" MaxLength="19"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="District is required" EnableClientScript="False" Text="*" ControlToValidate="District" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Street" CssClass="control-label col-md-2" Text="Street"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="Street" runat="server" CssClass="form-control" MaxLength="35"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Street is required" ControlToValidate="Street" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="Building" CssClass="control-label col-md-2" Text="Building"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="Building" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Building is required" ControlToValidate="Building" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="HomePhone" CssClass="control-label col-md-2" Text="Home Phone"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="HomePhone" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Home Phone is required" ControlToValidate="HomePhone" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="MobilePhone" CssClass="control-label col-md-2" Text="Mobile Phone"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="MobilePhone" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Mobile Phone is required" ControlToValidate="MobilePhone" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="BusinessPhone" CssClass="control-label col-md-2" Text="Business Phone"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="BusinessPhone" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Business Phone is required" Text="*" Display="Dynamic" CssClass="text-danger" ControlToValidate="BusinessPhone" EnableClientScript="False"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="HomeFax" CssClass="control-label col-md-2" Text="Home Fax"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="HomeFax" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
            </div>
        </div>
    </div>
    <h4>Employment Information</h4>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlEmploymentStatus" CssClass="control-label col-md-2" Text="Employment Status"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlEmploymentStatus" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select Status</asp:ListItem>
                    <asp:ListItem>Employed</asp:ListItem>
                    <asp:ListItem>Self-Employed</asp:ListItem>
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Retired</asp:ListItem>
                    <asp:ListItem>Homemaker</asp:ListItem>
                    <asp:ListItem>Not Employed</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Employment Status is required" ControlToValidate="ddlEmploymentStatus" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Occupation" CssClass="control-label col-md-2" Text="Occupation"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="Occupation" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Occupation is required" ControlToValidate="Occupation" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="YearsWithEmployer" CssClass="control-label col-md-2" Text="Years With Employer"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="YearsWithEmployer" runat="server" CssClass="form-control" MaxLength="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="Years With Employer is required" ControlToValidate="YearsWithEmployer" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="EmployerName" CssClass="control-label col-md-2" Text="Employer Name"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="EmployerName" runat="server" CssClass="form-control" MaxLength="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Employer Name is required" ControlToValidate="EmployerName" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="EmployerPhone" CssClass="control-label col-md-2" Text="Employer Phone"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="EmployerPhone" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Employer Phone is required" ControlToValidate="EmployerPhone" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="NatureOfBusiness" CssClass="control-label col-md-2" Text="Nature of Business"></asp:Label>
            <div class="col-md-4">
                <asp:TextBox ID="NatureOfBusiness" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Nature Of Business is required" Display="Dynamic" CssClass="text-danger" Text="*" ControlToValidate="NatureOfBusiness" EnableClientScript="False"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <h4>Disclosures and Regulatory Information</h4>
    <div class="col-xs-12" style="height:10px; top: 0px; left: 0px;"></div>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" CssClass="text-center col-md-4" Text="Are you employed by a registered securities broker/dealer, investment advisor, bank or other financial institution?" AssociatedControlID="ddlEmployedByFinanceInst"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlEmployedByFinanceInst" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="Finance Investment is required" ControlToValidate="ddlEmployedByFinanceInst" ClientIDMode="Inherit" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlMemberPublicTradedInst" CssClass="text-center col-md-4" Text="Are you a director, 10% shareholder or policy-making officer of a publicly traded company?"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlMemberPublicTradedInst" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Director status is required" ControlToValidate="ddlMemberPublicTradedInst" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">

            <asp:Label runat="server" AssociatedControlID="ddlPrimarySourceOfFunds" CssClass="text-center col-md-4" Text="Describe the primary source of funds deposited to this account."></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlPrimarySourceOfFunds" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>salary/wages/savings</asp:ListItem>
                    <asp:ListItem>investment/capital gains</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>family/relatives/inheritance</asp:ListItem>
                    <asp:ListItem>Other (describe below)</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Primary source is required" ControlToValidate="ddlPrimarySourceOfFunds" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <h4>Investment Profile</h4>
    <div class="form-horizontal">
        <div class="form_group">
            <asp:Label runat="server" AssociatedControlID="ddlInvestmentObjective" CssClass="control-label col-md-2" Text="Investment Objective"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlInvestmentObjective" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>capital preservation</asp:ListItem>
                    <asp:ListItem>income</asp:ListItem>
                    <asp:ListItem>growth</asp:ListItem>
                    <asp:ListItem>speculation</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="Investment Objective is required" ControlToValidate="ddlInvestmentObjective" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="ddlInvestmentKnowledge" CssClass="control-label col-md-2" Text="Investment Knowledge"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlInvestmentKnowledge" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>none</asp:ListItem>
                    <asp:ListItem>limited</asp:ListItem>
                    <asp:ListItem>good</asp:ListItem>
                    <asp:ListItem>extensive</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="Investment Knowledge status is required" InitialValue="0" EnableClientScript="False" ControlToValidate="ddlInvestmentKnowledge" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlAnnualIncome" CssClass="control-label col-md-2" Text="Annual Income"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlAnnualIncome" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>under HK$20,000</asp:ListItem>
                    <asp:ListItem>HK$20,001-HK$200,000</asp:ListItem>
                    <asp:ListItem>HK$200,001-HK$2,000,000</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="Annual Income is required" ControlToValidate="ddlAnnualIncome" EnableClientScript="False" InitialValue="0" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="ddlApproxLiquidNetWorth" CssClass="control-label col-md-2" Text="Approximate Liquid Net Worth"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlApproxLiquidNetWorth" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>under HK$100,000</asp:ListItem>
                    <asp:ListItem>HK$100,001-HK$1,000,000</asp:ListItem>
                    <asp:ListItem>HK$1,000,001-HK$10,000,000</asp:ListItem>
                    <asp:ListItem>more than HK$10,000,000</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="Liquid Net Worth status is required" Text="*" ControlToValidate="ddlApproxLiquidNetWorth" EnableClientScript="False" InitialValue="0" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <h4>Account Feature</h4>
    <div class="col-xs-12" style="height:10px; top: 0px; left: 0px;"></div>
    
          <asp:Label runat="server" CssClass="text-center col-md-8" Text="Initial deposite" AssociatedControlID="balance"></asp:Label>
          <div class="col-md-4">
                <asp:TextBox ID="balance" runat="server" CssClass="form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="Initial deposite is required" ControlToValidate="balance" EnableClientScript="False" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
          </div>

    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" CssClass="text-center col-md-8" Text="The Free Credit Balance in your HKeInvest account is not interest bearing. However, you may choose to earn interest on the Free Credit Balance in your account by having daily automatic investment in or redemption of (“sweep’) shares of our sweep fund (“Fund”). (The Free Credit Balance is the sum of the cash balances in your Cash Account and Margin Account (if applicable) offset by any debit balances and/or cash retained as collateral in the accounts.)" AssociatedControlID="ddlSweep"></asp:Label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlSweep" runat="server" CssClass="form-control" Width="180px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="Balance sweep status is required" ControlToValidate="ddlSweep" EnableClientScript="False" InitialValue="0" Text="*" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>

        </div>


         <div class="form-group">
             <div class="col-md-offset-2 col-md-10">
                 <asp:Button ID="Register" runat="server" Text="Register" CssClass="btn button-default" OnClick="Register_Click" />
             </div>
         </div>
     </div>
</asp:Content>
