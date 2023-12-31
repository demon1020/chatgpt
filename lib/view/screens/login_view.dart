import 'package:chatgpt/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {

  @override
  void dispose() {
    var authViewModel = Provider.of<LoginViewModel>(context, listen: false);
    authViewModel.disposeData();
    authViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
          // key: provider.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 100,
              ),

              const SizedBox(height: 50),

              const Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: AppColor.darkGrey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              AppTextField(
                controller: authViewModel.emailController,
                hintText: 'Email',
                obscureText: false,
                textInputType: TextInputType.emailAddress,
                // validator: (email) => Validator.validateEmail(email),
              ),

              const SizedBox(height: 10),

              AppTextField(
                controller: authViewModel.passwordController,
                hintText: 'Password',
                obscureText: true,
                showSuffixIcon: true,
                // validator: (pass) => Validator.validatePassword(pass),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              AppButton(
                text: "Sign In",
                isLoading: authViewModel.loading,
                onTap: () {
                      // Map data = {
                      //   'email' : _emailController.text.toString(),
                      //   'password' : _passwordController.text.toString(),
                      // };

                      Map data = {
                        'email' : 'test@gmail.com',
                        'password' : 'Test@12345',
                      };
                      authViewModel.loginApi(data);

                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // provider.toggle();
                    },
                    child: Text(
                      "Sign Up Now",
                      style: TextStyle(
                        color: AppColor.primaryDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
