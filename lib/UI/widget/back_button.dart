import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/auth/phone_page.dart';
import 'package:integral/blocs/auth_bloc/auth_bloc.dart';
import 'package:integral/models/user_data_repository.dart';
import 'package:integral/services/dio_authenticator.dart';
import 'package:integral/services/responsive_size.dart';
import 'package:integral/services/sp_data_rep.dart';

class BackButtonLeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: ResponsiveSize.height(40),
          width: ResponsiveSize.width(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).accentColor,
          ),
          child: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  final UserDataRepository deleter; //TODO: Подумать всё же об инжекторе

  const ExitButton({Key key, @required this.deleter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      child: GestureDetector(
        onTap: () async {
          await deleter.deleteData();
          //TODO:УЖАСНО! Вынести в отдельный роут!
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => AuthBloc(
                  SpDataRepository(),
                  DioAuthenticator(),
                ),
                child: PhonePage(),
              ),
            ),
          );
        },
        child: Container(
          height: ResponsiveSize.height(48),
          width: ResponsiveSize.width(38),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).accentColor,
          ),
          child: Icon(
            Icons.exit_to_app,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
