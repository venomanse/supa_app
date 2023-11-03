import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    validator: controller.validatePassword,
                    obscureText: controller.passwordInvisible.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: controller.togglePasswordInvisible,
                        child: Icon(controller.passwordInvisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.login,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () async =>
                          Get.toNamed<dynamic>(Routes.signUp),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
