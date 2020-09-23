<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Credit Card Statement Email</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600&display=swap" rel="stylesheet">
	<style>
		td {text-align:center;}
	</style>
</head>

<body
        style="padding: 30px 20px; margin: 0; background-color: #000847; font-family: 'Poppins', 'Roboto', 'Helvetica', sans-serif; font-size: 13px; color: #172B4D; font-weight: 400; text-align: left; overflow-x: hidden;">
<div class="container"
     style="max-width: 550px; box-sizing: border-box; width: 100%; min-width: 300px; margin: 0 auto; background-image: url('https://image.enkash.in/IMAGES/email-background-image.png'); background-position: 100.2% -0.1%; background-repeat: no-repeat; background-origin: border-box; background-clip: border-box; background-color: #fff; border-radius: 10px 10px 0 0; box-shadow: 0 0 6px rgba(0, 0, 0, .55); padding: 15px 28px 0;">
    <img src="https://image.enkash.in/IMAGES/EnKash-logo.png" alt="EnKash logo"
         style="margin: 70px auto 40px 0; display: block;">
    <div id="greetings-container" style="font-size: 14px; line-height: 25px; font-weight: 600; margin: 0 0 40px;">
        Dear ${username},
        <br><br>
        <p style="margin: 0 0 30px; padding: 0; line-height: 19px;">
            Greetings from EnKash.
            <br><br>
            Hope you are enjoying the incredible benefits & offers associated with the EnKash card.
        </p>
    </div>
    <div id="email-content" style="margin: 0; padding-bottom: 20px;">

        <p style="margin: 0 0 30px; padding: 0; line-height: 19px;">
            We would like to inform you that your E-statement for EnKash Credit Card account no xxxx-xxxx-xxxx-${last4}
            is generated for the period ${period}.
        <div style="column-count: 3; column-gap: 0.5rem; column-width: auto; text-align: center; margin: 1.2rem auto;">
            <div class="column-child" style="background-color: #F4F6F9; border-radius: 7px; padding: 1rem 0.6rem;">
                <div
                        style="color: #172B4D; font-size: 12px; font-weight: 400; line-height: 17px; margin-bottom: 1rem; word-wrap: break-word; word-break: break-all;">
                    Total Amount Due<br>(INR)
                </div>
                <div
                        style="color: #1D5BF5; font-weight: 600; font-size: 14px; line-height: 19px; word-wrap: break-word; word-break: break-all;">
                    ${outstandingAmount}
                </div>
            </div>
            <div class="column-child" style="background-color: #F4F6F9; border-radius: 7px; padding: 1rem 0.6rem;">
                <div
                        style="color: #172B4D; font-size: 12px; font-weight: 400; line-height: 17px; margin-bottom: 1rem; word-wrap: break-word; word-break: break-all;">
                    Minimum Amount Due<br>(INR)
                </div>
                <div
                        style="color: #1D5BF5; font-weight: 600; font-size: 14px; line-height: 19px; word-wrap: break-word; word-break: break-all;">
                    ${minDue}
                </div>
            </div>
            <div class="column-child" style="background-color: #F4F6F9; border-radius: 7px; padding: 1rem 0.6rem;">
                <div
                        style="color: #172B4D; font-size: 12px; font-weight: 400; line-height: 17px; margin-bottom: 1rem; word-wrap: break-word; word-break: break-all;">
                    Payment Due Date<br>(DD-MM-YYYY)
                </div>
                <div
                        style="color: #1D5BF5; font-weight: 600; font-size: 14px; line-height: 19px; word-wrap: break-word; word-break: break-all;">
                    ${dueDate}
                </div>
            </div>
        </div>
		
		<table style="width:100%;">
			<tr>
				<th>ID</th><th>Desc</th><th>Amount</th><th>Date</th>
			</tr>
			<#list transactionList as tran>
				<tr>
					<td>${tran.id}</td><td>${tran.tranDesc}</td><td>${tran.tranAmount}</td><td>${tran.tranDate}</td>
				</tr>
			<#else>
				<tr>
					<td colspan="4"> No transaction to display</td>
				</tr>
			</#list>
		</table>
        
		<br><br>
        Click here to view the statement & make payment against your EnKash Card : <a href="${paymentLink}"
                                                                                            style="outline: none; border: none;">${paymentLink}</a>
        <br><br>
        Alternatively, you can also make payment by NEFT / RTGS to your unique account no <span
            style="font-weight: 600;">ENKASHEC${cardAccountId}</span> and IFSC code <span
            style="font-weight: 600;"> KKBK0000958</span> associated with your EnKash card account (This virtual account
        is
        assigned to your EnKash Freedom Card only).
        <br><br>
        Please pay the total amount due before the due date to avoid any Interest charges.
        <p style="font-size: 13px; color: #1D5BF5; text-align: center; margin: 1rem auto 0.5rem; font-weight: 600;">
            Fees & Charges
        </p>
        </p>
        <table style="text-align: center; border-collapse: collapse; border: 1px solid #DFDFDF; margin: 0 auto 30px;">
            <tr>
                <th
                        style="border: 1px solid #DFDFDF; padding: 0.5rem 1rem; font-weight: 600; color: #172B4D; font-size: 12px; width: 44%;">
                    Transactions
                </th>
                <th
                        style="border: 1px solid #DFDFDF; padding: 0.5rem 1rem; font-weight: 600; color: #172B4D; font-size: 12px; width: 40%;">
                    Charges
                </th>
                <th
                        style="border: 1px solid #DFDFDF; padding: 0.5rem 1rem; font-weight: 600; color: #172B4D; font-size: 12px;">
                    GST
                </th>
            </tr>

            <tr>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">Annual Fees
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">${processingFee}% of
                    sanctioned limit
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">18%</td>
            </tr>

            <tr>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">Interest on
                    Carry forward balance
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    Interest at the rate of 2% per month will be charged for the entire billing cycle on the balance
                    outstanding
                    amount carried beyond the due date
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    18%
                </td>
            </tr>

            <tr>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    Fuel/IRCTC transaction charges *Some merchants levy extra charges to cardholders, this will be
                    billed to you
                    as per applicable by the merchant
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    As applicable by the Merchant/Acquirer
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">18%</td>
            </tr>

            <tr>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    ATM withdrawal interest charges
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    Upto 2% per month on amount withdrawn
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">18%</td>
            </tr>

            <tr>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    ATM withdrawal charges (Charged by the ATM owning bank)
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    Upto INR 20 per transaction
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">18%</td>
            </tr>

            <tr>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    Vendor/GST/Utility payments made on EnKash platform
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">
                    Payment gateway charges of 1.5% on the transaction amount
                </td>
                <td style="border: 1px solid #DFDFDF; padding: 0.5rem 0.7rem; font-size: 11px;">18%</td>
            </tr>
        </table>
        <hr style="width: 75%; margin: 0 auto 30px; opacity: 0.2;">
        <div style="margin: 0; padding: 0; line-height: 15px; font-size: 12px; text-align: center;">
            <p style="margin: 0; padding: 0;">
                For any assistance that you may require, please contact our support team:
                <span style="white-space: nowrap; color: #1D5BF5; display: block;">
            <a href="tel:+918530490475" style="cursor: pointer; color: #1D5BF5; text-decoration: none !important;">+91
              853 049
              0475</a>
            |
            <a href="mailto:freedom.support@enkash.com"
               style="cursor: pointer; color: #1D5BF5; text-decoration: none !important;">freedom.support@enkash.com</a>
          </span>
            </p>
            <br><br>
            <p style="margin: 0; padding: 0;">
                Warm Regards,
                <br>
                EnKash Ops
                <br>
                <a href="https://www.enkash.com" target="_blank"
                   style="cursor: pointer; color: #1D5BF5; text-decoration: none !important;">www.enkash.com</a>
            </p>
            <br><br>
            <small style="display: block; color: #7B8199; font-size: 8px; line-height: 15px; text-align: center;">
                This is a System generated Email. Please do not reply to this Email Address.
            </small>
        </div>
    </div>
</div>
<div id="footer-container"
     style="max-width: 550px; box-sizing: border-box; width: 100%; min-width: 300px; margin: 0 auto; border-radius: 0 0 10px 10px; padding: 15px 30px; background-color: #F4F6F9; text-align: center; font-size: 11px; color: #515978; line-height: 15px;">
    <img src="https://image.enkash.in/IMAGES/EnKash-logo.png" alt="EnKash logo"
         style="margin: 10px auto 20px; display: block; max-width: 60px;">
    <p style="margin: 0 auto; padding: 0;">
        EnKash is a Business Banking and Corporate Card platform.
    </p>
    <br>
    <p style="margin: 0 auto; text-transform: uppercase; font-weight: 600; padding: 0;">
        Our banking product suite offers you
    </p>
    <br>
    <div id="product-pills" style="margin: 0 0 30px; padding: 0;">
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Supplier Payments
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Tax Payments
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Utility Payments
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Vendor KYC Verification
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Bank Account Verification
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Tally Pluggin
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Built-In Payment Gateway
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Send Automated Reminders
        </div>
        <div class="products"
             style="border-radius: 200px; background-color: #fff; border: 1px solid #D0E2FC; height: 24px; white-space: nowrap; line-height: 25px; margin: 5px; display: inline-block; padding: 0 18px; font-weight: 600;">
            Collect Money From Customers
        </div>
    </div>
    <p style="margin: 0 0 30px; padding: 0;">
        If you are looking for short term credit or working capital to fund your business or if you are looking
        to get business / corporate cards for your team, EnKash Freedom cards offer you a host of features to
        take care of all your business payment needs.
    </p>
    <div id="register-now-container" style="margin: 0 0 30px; padding: 0;">
        <p style="margin: 0; padding: 0;">
            Don't have an EnKash Account?
        </p>
        <br>
        <div
                style="margin: 0; padding: 0; background-color: #CBEAFF; height: 30px; border-radius: 100px; display: inline-block; line-height: 30px; padding: 0 15px;">
            <a href="https://payout.enkash.in/signup" target="_blank"
               style="cursor: pointer; color: #1D5BF5; text-decoration: none !important; text-transform: uppercase; line-height: 17px; font-weight: 600;">
                Get it now
            </a>
        </div>
    </div>
    <div id="icons-container" style="margin: 0; padding: 0;">
        <a href="https://www.facebook.com/Enkashbusiness" style="text-decoration: none;" target="_blank">
            <img src="https://image.enkash.in/IMAGES/fb-icon.png" alt="facebook"
                 style="margin: 0 3px; display: inline-block;">
        </a>
        <a href="https://twitter.com/EnkashBusiness" style="text-decoration: none;" target="_blank">
            <img src="https://image.enkash.in/IMAGES/twitter-icon.png" alt="twiiter"
                 style="margin: 0 3px; display: inline-block;">
        </a>
        <a href="https://www.linkedin.com/company/enkashbusiness" style="text-decoration: none;" target="_blank">
            <img src="https://image.enkash.in/IMAGES/linkedin-icon.png" alt="linkedin"
                 style="margin: 0 3px; display: inline-block;">
        </a>
        <a href="https://www.instagram.com/Enkashbusiness" style="text-decoration: none;" target="_blank">
            <img src="https://image.enkash.in/IMAGES/insta-icon.png" alt="instagram"
                 style="margin: 0 3px; display: inline-block;">
        </a>
    </div>
</div>
</body>

</html>