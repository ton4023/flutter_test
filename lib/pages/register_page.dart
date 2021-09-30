import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
        child: Padding(
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
                    FormBuilderTextField(
                      name: 'firstname',
                      decoration: InputDecoration(
                        prefixText: 'First Name : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: 'Please enter yours first name',
                      ),
                      onChanged: (value) {},
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                       
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'lastname',
                      decoration: InputDecoration(
                        prefixText: 'Last Name : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: 'Please enter yours last name',
                      ),
                      onChanged: (value) {},
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'username',
                      decoration: InputDecoration(
                        prefixText: 'User Name : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: 'Please enter yours user name',
                      ),
                      onChanged: (value) {},
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'Password',
                      decoration: InputDecoration(
                        prefixText: 'Password : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: 'Please enter yours password',
                      ),
                      onChanged: (value) {},
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'confirmPassword',
                      decoration: InputDecoration(
                        prefixText: 'Confirm Password : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: 'Please enter yours confirm password',
                      ),
                      onChanged: (value) {},
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        prefixText: 'Email : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: 'example@email.com',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: InputDecoration(
                        prefixText: 'Phone : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: '(999)-999-9999',
                      ),
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '(###) ###-####',
                            filter: {"#": RegExp(r'[0-9]')})
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context)
                      ]),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderChoiceChip(
                      name: 'gender',
                      decoration: InputDecoration(
                        prefixText: 'Gender : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Male', child: Text('Male')),
                        FormBuilderFieldOption(
                            value: 'Female', child: Text('Female')),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      onChanged: (value) {},
                      inputType: InputType.date,
                      decoration: InputDecoration(
                        prefixText: 'Date of birth : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        labelText: 'Select Date of birth',
                      ),
                      initialDate: DateTime.now(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderDropdown(
                      name: 'course',
                      decoration: InputDecoration(
                        prefixText: 'Date of birth : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderChoiceChip(
                      name: 'nationality',
                      decoration: InputDecoration(
                       prefixText: 'Nationality : ',
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Thai', child: Text('Thai')),
                        FormBuilderFieldOption(
                            value: 'Chinese', child: Text('Chinese')),
                        FormBuilderFieldOption(
                            value: 'England', child: Text('England')),
                        FormBuilderFieldOption(
                            value: 'Other', child: Text('Other')),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderCheckbox(
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
                        errorText:
                            'You must accept terms and conditions to continue',
                      ),
                    ),
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
                        if (_formKey.currentState!.validate()) {
                          print(_formKey.currentState!.value);
                        } else {
                          print("validation failed");
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
}
