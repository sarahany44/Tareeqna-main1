import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/loginpage.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_cubit.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_state.dart';
import 'package:tareeqna/core/styles.dart';
import 'package:tareeqna/Features/main_layout/Presentation/views/main_screen.dart';
import '../../wedigts/custom_appbar.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  CountryCode _countryCode = CountryCode.fromCountryCode('EG');
  bool _isAgreed = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (!_isAgreed) {
      _showSnackBar('You must agree to the Terms & Conditions', isError: true);
      return;
    }

    final fullPhone = '${_countryCode.dialCode}${_phoneController.text.trim()}';

    context.read<AuthCubit>().register(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phoneNumber: fullPhone,
          password: _passwordController.text.trim(),
        );
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          _showSnackBar(state.message, isError: true);
        }

        if (state is AuthSuccess) {
          _showSnackBar('Registration successful! Welcome ${state.user.name}!');
          
          // Navigate directly to main screen (skip verification)
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const MainScreen(),
              ),
              (route) => false, // Remove all previous routes
            );
          });
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffF9F9F9),

            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),

                      CustomAppBar(
                        title: "",
                        showLogo: true,

                      ),

                      // Title
                      Text(
                        'Create Account',
                        style: AppTextStyles.title24,
                        textAlign: TextAlign.center,
                      ),
            
                      const SizedBox(height: 10),
            
                      Text(
                        'Join our carpooling community',
                        style: AppTextStyles.body14,
                        textAlign: TextAlign.center,
                      ),
            
                      const SizedBox(height: 30),
            
                      // Name Field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                       
                          labelText: 'Full Name',
                         
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          if (value.length < 3) {
                            return 'Name must be at least 3 characters';
                          }
                          return null;
                        },
                      ),
            
                      const SizedBox(height: 16),
            
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
            
                      const SizedBox(height: 16),
            
                      // Phone Field
                      Row(
                        children: [
                          CountryCodePicker(
                            initialSelection: _countryCode.code,
                            onChanged: (code) => setState(() {
                              _countryCode = code;
                            }),
                            favorite: const ['+20', 'EG'],
                            showFlag: true,
                            showFlagDialog: true,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required';
                                }
                                if (value.length < 10) {
                                  return 'Enter a valid phone number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
            
                      const SizedBox(height: 16),
            
                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Minimum 6 characters required';
                          }
                          return null;
                        },
                      ),
            
                      const SizedBox(height: 16),
            
                      // Terms & Conditions
                      Row(
                        children: [
                          Checkbox(
                            value: _isAgreed,
                            onChanged: (val) {
                              setState(() {
                                _isAgreed = val ?? false;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'I agree to the Terms & Conditions',
                            ),
                          ),
                        ],
                      ),
            
                      const SizedBox(height: 25),
            
                      // Submit Button
                      state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              height: 70,
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:Color(0xff008553),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: AppTextStyles.button16,
                                ),
                              ),
                            ),
            
                      const SizedBox(height: 16),
            
                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account? '),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return LoginPage();
                              }));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}