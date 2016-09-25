using NUnit.Framework;
using HKeInvestWebApplication.Code_File;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HKeInvestWebApplication.Code_File;

namespace HKeInvestWebApplication.Code_File.Tests
{
    [TestFixture()]

    public class HKeInvestCodeTests
    {
        HKeInvestCode my;
        [OneTimeSetUp]
        public void TestSetup()
        {
            my = new HKeInvestCode();
        }
        [Test()]
        [TestCase("EUR","8.488","HKD","1.000",10.00,84.88)]
        [TestCase("GBP", "11.100", "HKD", "1.000", 10.00,111.00)]
        [TestCase("JPY", "0.065", "HKD", "1.000", 10.00,0.64)]
        [TestCase("HKD", "1.000", "HKD", "1.000", 10.00,10.00)]
        [TestCase("USD", "7.791", "HKD", "1.000", 10.00,77.90)]
        public void convertCurrencyTest( string a,string b, string c, string d, decimal e, decimal result)
        {
            Assert.That(my.convertCurrency(a,b,c,d,e), Is.EqualTo(result));
        }

    }
}