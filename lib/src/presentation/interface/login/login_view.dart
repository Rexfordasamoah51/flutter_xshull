import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:xscholl/src/presentation/interface/shared/widget_background.dart';
import 'package:sizer/sizer.dart';
import 'package:xscholl/src/presentation/theme/color/color_pelettes.dart';

import '../../../../assets.dart';
import 'components/email_validator.dart';
import 'components/login_action.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    return BaseBackground(
      child: Stack(
        children: <Widget>[
         
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: kXschollWhite,
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi Student",
                            style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Colors.black
                            )),
                            SizedBox(
                              height: 10,
                            ),
                        Text("Sign in to continue",
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:50.0),
                    child: Form(
                      key: LoginAction.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                              style: Theme.of(context).textTheme.subtitle1),
                          XsholllCustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            inputLabel: 'user@gmail.com',
                            validate: (value) {
                              if (EmailValidator.validate(value) == false) {
                                return 'Invalid  Email';
                              }
                              return null;
                            },
                            save: (value) {
                              LoginAction.credentials.userEmail = value;
                            },
                          ),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          Text("Password",
                              style: Theme.of(context).textTheme.subtitle1),
                          XsholllCustomTextField(
                            obsure: true,
                            inputLabel: '########',
                            keyboardType: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value.length < 6) {
                                return 'Check your passowrd again';
                              }
                              return null;
                            },
                            save: (value) {
                              LoginAction.credentials.userPassword = value;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  XshollCustomButton(
                    label: 'SIGN IN',
                    onTap: () {
                      if (LoginAction.formKey.currentState.validate()) {
                        LoginAction.formKey.currentState.save();
                        Navigator.pushNamed(context, '/home');
                        print(LoginAction.credentials.userEmail +
                            ' and ' +
                            LoginAction.credentials.userPassword);
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text("Forgot Password?",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 15.0.sp, color: kXschollBlack)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Image.asset(Assets.toy),
                ),
        ],
      ),
    );
  }
}

class XshollCustomButton extends StatelessWidget {
  const XshollCustomButton({
    Key key,
    this.label,
    this.onTap,
  }) : super(key: key);

  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 6.5.h,
        alignment: Alignment.center,
        child: ListTile(
            title: Center(
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: kXschollWhite),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_sharp,
              color: kXschollWhite,
            )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [kXschollBlue, kXschollLightBlue])),
      ),
    );
  }
}

class XsholllCustomTextField extends StatelessWidget {
  const XsholllCustomTextField({
    Key key,
    this.inputLabel,
    this.icon,
    this.save,
    this.validate,
    this.obsure = false,
    this.keyboardType,
  }) : super(key: key);
  final String inputLabel;
  final Widget icon;
  final Function save;
  final Function validate;
  final bool obsure;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      onSaved: save,
      obscureText: obsure,
      validator: validate,
      keyboardType: keyboardType,
      style: Theme.of(context)
          .textTheme
          .headline2
          .copyWith(fontSize: 15.0.sp, color: kXschollBlack),
      decoration: InputDecoration(suffixIcon: icon, hintText: inputLabel),
    );
  }
}
