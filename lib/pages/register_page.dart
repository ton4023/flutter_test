import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade100,
                Colors.deepPurple.shade50,
                Colors.purple.shade100,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Image.asset('images/add-user.png'),
                    ),
                    _firstnameField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _lastnameField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _usernameField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _passwordField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _confirmPasswordField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _emailField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _phoneField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _genderField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _birthField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _courseField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _nationalityField(context),
                    SizedBox(
                      height: 10,
                    ),
                    _acceptTerms(context),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState!.save();
              
                        if (_formKey.currentState!.validate() && _formKey.currentState!.value['password'] == _formKey.currentState!.value['confirmPassword']) {
                          Fluttertoast.showToast(
                              msg: "register success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          print(_formKey.currentState!.value);
                           _formKey.currentState!.reset();
                        } else {
                          Fluttertoast.showToast(
                              msg: "password not match",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          print("password not match");
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
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

  FormBuilderCheckbox _acceptTerms(BuildContext context) {
    return FormBuilderCheckbox(
      name: 'accept_terms',
      initialValue: false,
      onChanged: (value) {},
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'I have read and agree to the ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'Terms and Conditions',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      validator: FormBuilderValidators.equal(
        context,
        true,
        errorText: 'You must accept terms and conditions to continue',
      ),
    );
  }

  FormBuilderChoiceChip<String> _nationalityField(BuildContext context) {
    return FormBuilderChoiceChip(
      name: 'nationality',
      decoration: InputDecoration(
        prefixText: 'Nationality : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
      ),
      options: [
        FormBuilderFieldOption(value: 'Thai', child: Text('Thai')),
        FormBuilderFieldOption(value: 'Chinese', child: Text('Chinese')),
        FormBuilderFieldOption(value: 'England', child: Text('England')),
        FormBuilderFieldOption(value: 'Other', child: Text('Other')),
      ],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
    );
  }

  FormBuilderDropdown<String> _courseField(BuildContext context) {
    return FormBuilderDropdown(
      name: 'course',
      decoration: InputDecoration(
        prefixText: 'Course : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'Select Course',
      ),
      allowClear: true,
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      items: ['Course1', 'Course2', 'Course3']
          .map((course) => DropdownMenuItem(
                value: course,
                child: Text('$course'),
              ))
          .toList(),
    );
  }

  FormBuilderDateTimePicker _birthField(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: 'date',
      inputType: InputType.date,
      decoration: InputDecoration(
        prefixText: 'Date of birth : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'Select Date of birth',
      ),
      initialDate: DateTime.now(),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
    );
  }

  FormBuilderRadioGroup<String> _genderField(BuildContext context) {
    return FormBuilderRadioGroup(
      name: 'gender',
      decoration: InputDecoration(
        prefixText: 'Gender',
        prefixStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
      ),
      options: [
        FormBuilderFieldOption(value: 'Male', child: Text('Male')),
        FormBuilderFieldOption(value: 'Female', child: Text('Female')),
      ],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
    );
  }

  FormBuilderTextField _phoneField(BuildContext context) {
    return FormBuilderTextField(
      name: 'phone',
      decoration: InputDecoration(
        prefixText: 'Phone : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: '(999)-999-9999',
      ),
      inputFormatters: [
        MaskTextInputFormatter(
            mask: '(###)-###-####', filter: {"#": RegExp(r'[0-9]')})
      ],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
      keyboardType: TextInputType.phone,
    );
  }

  FormBuilderTextField _emailField(BuildContext context) {
    return FormBuilderTextField(
      name: 'email',
      decoration: InputDecoration(
        prefixText: 'Email : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'example@email.com',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.email(context),
      ]),
      keyboardType: TextInputType.emailAddress,
    );
  }

  FormBuilderTextField _confirmPasswordField(BuildContext context) {
    return FormBuilderTextField(
      name: 'confirmPassword',
      obscureText: true,
      decoration: InputDecoration(
        prefixText: 'Confirm Password : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'Please enter yours confirm password (A-Z,0-9)',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  FormBuilderTextField _passwordField(BuildContext context) {
    return FormBuilderTextField(
      name: 'password',
      obscureText: true,
      decoration: InputDecoration(
        prefixText: 'Password : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'Please enter yours password (A-Z,0-9)',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.match(
            context, r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
      ]),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  FormBuilderTextField _usernameField(BuildContext context) {
    return FormBuilderTextField(
      name: 'username',
      decoration: InputDecoration(
        prefixText: 'User Name : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'Please enter yours user name',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
      keyboardType: TextInputType.text,
    );
  }

  FormBuilderTextField _lastnameField(BuildContext context) {
    return FormBuilderTextField(
      name: 'lastname',
      decoration: InputDecoration(
        prefixText: 'Last Name : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'Please enter yours last name',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
      keyboardType: TextInputType.text,
    );
  }

  FormBuilderTextField _firstnameField(BuildContext context) {
    return FormBuilderTextField(
      name: 'firstname',
      decoration: InputDecoration(
        prefixText: 'First Name : ',
        prefixStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelText: 'Please enter yours first name',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
      keyboardType: TextInputType.text,
    );
  }
}
