import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:my_app/Login/View/register/RegistrationViewModel.dart';

class UserOption extends StatelessWidget {
  const UserOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<RegisterViewModel>(builder: (context, viewModel) {
      return FractionallySizedBox(
        heightFactor: 0.75,
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
                  'Choose Account Type',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Two images for barber and customer
                    InkWell(
                      onTap: () {
                        viewModel.setSelectedUserType('Barber');
                      },
                      child: Image.network(
                        'https://cdn.camberwellshopping.com.au/wp-content/uploads/2021/07/13111806/The-best-barbers-in-Camberwell.jpg',
                        width: 200, // Adjust the width as needed
                        height: 200, // Adjust the height as needed
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    InkWell(
                      onTap: () {
                        viewModel.setSelectedUserType('Customer');
                      },
                      child: Image.network(
                        'https://cdn.camberwellshopping.com.au/wp-content/uploads/2021/07/13111806/The-best-barbers-in-Camberwell.jpg',
                        width: 200, // Adjust the width as needed
                        height: 200, // Adjust the height as needed
                      ),
                    ),
                    // Other widgets can be added here
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
