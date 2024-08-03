import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumbled/common/theme.dart';
import 'package:jumbled/dto/create_user_dto.dart';
import 'package:jumbled/presentation/component/button/j_button.dart';
import 'package:jumbled/presentation/component/form/j_textfield.dart';
import 'package:jumbled/presentation/component/typography/j_text.dart';
import 'package:jumbled/presentation/state/auth/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscure = true;
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.sizeOf(context).width < 700
          ? Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                color: JTheme.primaryColor,
                image: const DecorationImage(
                  image: AssetImage(
                    'asset/image/login-bg.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.1,
                  vertical: MediaQuery.sizeOf(context).width * 0.2,
                ),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const JText(
                      'Register!',
                      size: 32,
                    ),
                    const JText(
                      'Register an account for more experience',
                      size: 16,
                    ),
                    const SizedBox(height: 16),
                    JTextField(
                      'Email',
                      controller: email,
                    ),
                    const SizedBox(height: 16),
                    JTextField(
                      'Password',
                      obscure: obscure,
                      controller: password,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    JTextField(
                      'Username',
                      controller: username,
                    ),
                    const SizedBox(height: 16),
                    JTextField(
                      'Phone number',
                      controller: phone,
                    ),
                    const SizedBox(height: 16),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        print(state);
                        if (state is Registered) {
                          context.pushNamed('main');
                        } else if (state is AuthError) {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return const AlertDialog(
                                  title: JText('Error'),
                                  content: JText('Something went wrong'),
                                );
                              });
                        }
                      },
                      builder: (context, state) {
                        return state is Registering
                            ? const Center(child: CircularProgressIndicator())
                            : JElevatedButton(
                                text: 'Register',
                                letterSpacing: 3,
                                onPressed: () {
                                  context.read<AuthCubit>().register(
                                          createUserDto: CreateUserDto(
                                        email: email.text,
                                        password: password.text,
                                        phoneNumber: phone.text,
                                        userName: username.text,
                                      ));
                                },
                                backgroundColor: JTheme.primaryColor,
                                foregroundColor: Colors.white,
                                radius: 0,
                                size:
                                    Size(MediaQuery.sizeOf(context).width, 48),
                              );
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const JText('Already have an account?'),
                        JTextButton(
                          text: 'Login',
                          onPressed: () {},
                          textColor: JTheme.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: JTheme.primaryColor,
                    image: const DecorationImage(
                      image: AssetImage(
                        'asset/image/login-bg.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.sizeOf(context).width < 1300
                            ? MediaQuery.sizeOf(context).width * 0.05
                            : MediaQuery.sizeOf(context).width * 0.1),
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const JText(
                          'Register!',
                          size: 32,
                        ),
                        const JText(
                          'Register an account for more experience',
                          size: 16,
                        ),
                        const SizedBox(height: 16),
                        JTextField(
                          'Email',
                          controller: email,
                        ),
                        const SizedBox(height: 16),
                        JTextField(
                          'Password',
                          obscure: obscure,
                          controller: password,
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            icon: Icon(
                              obscure ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        JTextField(
                          'Username',
                          controller: username,
                        ),
                        const SizedBox(height: 16),
                        JTextField(
                          'Phone number',
                          controller: phone,
                        ),
                        const SizedBox(height: 16),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            print(state);

                            if (state is Registered) {
                              context.pushNamed('main');
                            } else if (state is AuthError) {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return const AlertDialog(
                                      title: JText('Error'),
                                      content: JText('Something went wrong'),
                                    );
                                  });
                            }
                          },
                          builder: (context, state) {
                            return state is Registering
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : JElevatedButton(
                                    text: 'Register',
                                    letterSpacing: 3,
                                    onPressed: () {
                                      context.read<AuthCubit>().register(
                                              createUserDto: CreateUserDto(
                                            email: email.text,
                                            password: password.text,
                                            phoneNumber: phone.text,
                                            userName: username.text,
                                          ));
                                    },
                                    backgroundColor: JTheme.primaryColor,
                                    foregroundColor: Colors.white,
                                    radius: 0,
                                    size: Size(
                                        MediaQuery.sizeOf(context).width, 48),
                                  );
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const JText('Already have an account?'),
                            JTextButton(
                              text: 'Login',
                              onPressed: () {},
                              textColor: JTheme.primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
