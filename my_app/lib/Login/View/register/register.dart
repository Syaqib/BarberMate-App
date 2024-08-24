import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Login/Models/RegistrationModel.dart';
import 'package:my_app/Login/View/register/RegistrationViewModel.dart';

class RegistrationModal extends StatefulWidget {
  const RegistrationModal({Key? key}) : super(key: key);

  @override
  _RegistrationModalState createState() => _RegistrationModalState();
}

class _RegistrationModalState extends State<RegistrationModal> {
  int _currentSegment = 0; // 0 for barber, 1 for customer

  @override
  Widget build(BuildContext context) {
    final RegistrationModel model =
        RegistrationModel("", "", "", "", "", "", "");
    final RegisterViewModel viewModel = RegisterViewModel();

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_downward),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal
                },
              ),
              centerTitle: true,
              title: const Text(
                'Register',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // SegmentedControl to switch between Barber and Customer
                  CupertinoSegmentedControl<int>(
                    children: {
                      0: Text('Barber'),
                      1: Text('Customer'),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        _currentSegment = value!;
                      });
                    },
                    groupValue: _currentSegment,
                  ),
                  const SizedBox(height: 16.0),
                  // Form for Barber or Customer based on the selected segment
                  Form(
                    key:
                        GlobalKey<FormState>(), // Add a global key for the form
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Full Name'),
                          onChanged: (value) => model.fullName = value,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'ID/Passport Card'),
                          onChanged: (value) => model.idOrPassportCard = value,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                          onChanged: (value) => model.phoneNumber = value,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => model.email = value,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          onChanged: (value) => model.password = value,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                          onChanged: (value) => model.confirmPassword = value,
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            // Use _currentSegment to determine the user type (barber or customer)
                            if (_currentSegment == 0) {
                              // Register as Barber
                              model.userType = 'Barber';
                            } else {
                              // Register as Customer
                              model.userType = 'Customer';
                            }
                            await viewModel.addNewUSer(model);
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
