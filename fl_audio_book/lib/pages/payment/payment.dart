import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardHolderName = '';
  String expiryDate = '';
  String cvvCode = '';
  String cardNumber = '';
  bool isCVVFocused = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          getTranslate(context, 'payment.get_premium'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          creditCard(size),
          creditcardfromField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          paymentButton(size),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  paymentButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/success');
      },
      child: Container(
        height: size.height * 0.07,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.2),
              blurRadius: 24,
              offset: const Offset(12, 12),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'payment.payment'),
          style: bold18White,
        ),
      ),
    );
  }

  creditcardfromField() {
    return CreditCardForm(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      obscureCvv: true,
      cursorColor: primaryColor,
      onCreditCardModelChange: (CreditCardModel creditCardModel) {
        setState(() {
          cardHolderName = creditCardModel.cardHolderName;
          cardNumber = creditCardModel.cardNumber;
          cvvCode = creditCardModel.cvvCode;
          expiryDate = creditCardModel.expiryDate;
          isCVVFocused = creditCardModel.isCvvFocused;
        });
      },
      themeColor: primaryColor,
      formKey: formKey,
      cardNumberDecoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        labelText: getTranslate(context, 'payment.card_number'),
        labelStyle: semibold20Grey94,
        hintText: getTranslate(context, 'payment.enter_number'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2,
          vertical: fixPadding * 1.8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      expiryDateDecoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        labelText: getTranslate(context, 'payment.expire_date'),
        labelStyle: semibold20Grey94,
        hintText: "MM/YY",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2,
          vertical: fixPadding * 1.8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      cvvCodeDecoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        labelText: getTranslate(context, 'payment.cvv'),
        labelStyle: semibold20Grey94,
        hintText: getTranslate(context, 'payment.enter_cvv'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2,
          vertical: fixPadding * 1.8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      cardHolderDecoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        labelText: getTranslate(context, 'payment.name_card'),
        labelStyle: semibold20Grey94,
        hintText: getTranslate(context, 'payment.enter_name'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2,
          vertical: fixPadding * 1.8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  creditCard(Size size) {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      cardBgColor: backgroundColor,
      showBackView: isCVVFocused,
      height: size.height * 0.3,
      backgroundImage: "assets/payment/1.png",
      bankName: getTranslate(context, 'payment.credit_card'),
      isChipVisible: false,
      isHolderNameVisible: true,
      cardType: CardType.mastercard,
      customCardTypeIcons: [
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            "assets/payment/Ask Mastercard Logo.png",
            height: size.height * 0.04,
          ),
        )
      ],
      labelCardHolder: getTranslate(context, 'payment.card_holdar'),
      obscureCardNumber: true,
      obscureCardCvv: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}
