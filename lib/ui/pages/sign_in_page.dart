import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({ Key? key }) : super(key: key);
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title(){
      return Container(
        margin: const EdgeInsets.only(top:20),
        child: Text(
          "Sign in with your existing account",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() => CustomTextFormField(title: 'Email Address', hintText: 'Your Email Address', controller: emailController,);
      Widget passwordInput() => CustomTextFormField(title: 'Password', hintText: 'Your Password', isObscure: true, controller: passwordController,);
      Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state){
          if(state is AuthSuccess){
            Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
          }
          else if (state is AuthFailed){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: kRedColor,
              )
            );
          }
        },
        builder: (context, state){
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: 'Sign In', 
            onPressed: (){
              context.read<AuthCubit>().signIn(
                email: emailController.text, 
                password: passwordController.text,  
              );
          });
        }
      );

      return Container(
        margin: const EdgeInsets.only(top: 35),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius)
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton()
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 5),
        child: TextButton(
          onPressed: (){
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Text(
            'Don\'t have an account? Sign Up',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline
            )
          ),
        ),
      );
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [
              title(),
              inputSection(),
              signInButton()
            ],
          ),
        )
      )
    );
  }
}