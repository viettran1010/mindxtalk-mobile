import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindxtalk/bloc/config/config_bloc.dart';
import 'package:mindxtalk/injection/injection.dart';
import 'package:mindxtalk/shared/shared.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      appBar: AppBarCustom(
        context: context,
        title: 'Testing',
      ),
      resizeToAvoidBottomInset: false,
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Column(
              children: [
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: _header(),
                // ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    margin: EdgeInsets.only(bottom: 30),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _formLogin(),
                        SizedBox(
                          height: 50,
                        ),
                        // goPageAnimation(
                        //     page: SignUpPage(),
                        //     onCallBack: (openContainer) =>
                        //         _footer(onTap: () async {
                        //           final isDeviceJailbreak =
                        //               await FlutterJailbreakDetection
                        //                   .jailbroken;
                        //           if (isDeviceJailbreak == true) {
                        //             _showAlertJailbreak();
                        //           } else {
                        //             openContainer();
                        //           }
                        //         }))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // DraggableScrollableSheet(
            //   initialChildSize: 0.20,
            //   minChildSize: 0.20,
            //   maxChildSize: 0.9,
            //   expand: true,
            //   builder: (context, scrollController) {
            //     return SingleChildScrollView(
            //         controller: scrollController,
            //         child: CustomScrollBottom());
            //   },
            // )
          ],
        ),
      ),
    );
  }

  String userName = "";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  _formLogin() {
    return Container(
      child: Column(
        children: [
          userName.isEmpty
              ? inputForm(
                  _usernameController,
                  hintText: 'Username',
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Xin chào, ",
                      style: UITextStyle.titleBoldStyle(context,
                          color: Colors.white, fontSize: 20),
                    ),
                    Expanded(
                      child: Text(
                        userName.toUpperCase(),
                        style: UITextStyle.titleBoldStyle(context,
                            color: Colors.white, fontSize: 20),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
          SizedBox(height: 16),
          inputForm(
            _passwordController,
            hintText: 'Password',
            obscureText: _obscureText,
            labelColor: Theme.of(context).accentColor,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Color(0xFFFFFFFF).withOpacity(0.68),
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            children: [
              // InkWell(
              //   onTap: () => go(context, ForgotPassword()),
              //   child: Text(
              //     S.of(context).forgot_password,
              //     style: UITextStyle.settingStyle(context,
              //         color: Theme.of(context).textSelectionColor),
              //   ),
              // ),
              if (userName.isNotEmpty)
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        userName = "";
                      });
                    },
                    child: Text(
                      "It's not me",
                      style: UITextStyle.settingStyle(context,
                          color: Theme.of(context)
                              .textSelectionTheme
                              .selectionColor),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          SimpleButton(
            icon: SvgPicture.asset(ImageAssets.icLock),
            title: 'Sign in',
            onTap: () async {
              getIt.get<ConfigBloc>().updateThemeConfig(
                  getIt.get<AppTheme>().theme == ThemeConfig.dark
                      ? ThemeConfig.light
                      : ThemeConfig.dark);
            },
          ),
          SizedBox(
            height: 10,
          ),
          if (userName.isNotEmpty)
            SimpleButton(
              icon: SvgPicture.asset(ImageAssets.icFaceId),
              title: 'Use FaceID',
              color: Theme.of(context).accentColor,
              onTap: () {},
            )
        ],
      ),
    );
  }

  Widget inputForm(TextEditingController controller,
      {String? hintText,
      Color? labelColor,
      Widget? prefixIcon,
      Widget? suffix,
      Widget? suffixIcon,
      Function(String)? onChange,
      bool obscureText = false}) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Color(0xFFFFFFFF).withOpacity(0.68),
        onChanged: onChange,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: UITextStyle.textFieldStyle(context,
              color: Color(0xFFFFFFFF).withOpacity(0.68)),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          fillColor: Color(0xFF000000).withOpacity(0.24),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Color(0xFFC2C2C2)),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xFFC2C2C2)),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
        ),
        style: UITextStyle.textFieldStyle(
          context,
          color: Color(0xFFFFFFFF).withOpacity(0.68),
        ));
  }
}

class SimpleButton extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final Color? color;
  final double? borderRadius;
  final void Function()? onTap;

  SimpleButton(
      {this.icon,
      this.onTap,
      @required this.title,
      this.color = const Color(0xFFFF4913),
      this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color!,
      borderRadius: BorderRadius.circular(borderRadius!),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              if (icon != null)
                SizedBox(
                  width: 10,
                ),
              Text(title!,
                  style: UITextStyle.buttonStyle(context, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
