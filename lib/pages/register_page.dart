import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubit/user_cubit.dart';
import '/pages/home_page.dart';
import '/repository/user_repository.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _userRepository = UserRepository();
  final editText = false;
  final coruses = ['coruse1', 'coruse2', 'coruse3'];
  final coruse = "";
  final nationals = ['Thai', 'Chinese', 'England'];
  final national = '';
  final birth = '';
  final gender = '';
  //Field
  final _fistnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(userRepository: _userRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register Information'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _fistnameField(),
                        _lastnameField(),
                        _usernameField(),
                        _passwordField(),
                        _confirmPasswordField(),
                        _emailField(),
                        _genderField(),
                        _mobileField(),
                        _birthField(),
                        _coruseField(),
                        _nationalityField(),
                        _imageField(),
                        _registerButton(),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fistnameField() {
    return TextFormField(
      controller: _fistnameController,
      decoration: InputDecoration(
          icon: Icon(Icons.person), labelText: 'Please enter yours first name'),
    );
  }

  Widget _lastnameField() {
    return TextFormField(
      controller: _lastnameController,
      decoration: InputDecoration(
          icon: Icon(Icons.person), labelText: 'Please enter yours last name'),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
          icon: Icon(Icons.person), labelText: 'Please enter yours your name'),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Password Empty';
        } else if (!passValid(val)) {
          print(!passValid(val));
          return 'Password Type Error';
        }
        return null;
      },
      controller: _passwordController,
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Please enter password 8 charactor (A-Z,0-9)'),
    );
  }

  Widget _confirmPasswordField() {
    return TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return 'Password Empty';
        } else if (val != _passwordController.text) {
          return 'Password Not Match';
        }
        return null;
      },
      obscureText: true,
      controller: _confirmPasswordontroller,
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Please enter password 8 charactor (A-Z,0-9)'),
    );
  }

  Widget _genderField() {
    return Row(
      children: [
        Icon(Icons.attribution),
        SizedBox(
          width: 10,
        ),
        Radio(
          value: gender,
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              print(value);
              value = gender;
            });
          },
        ),
        Text('Man'),
        SizedBox(
          width: 10,
        ),
        Radio(
          value: gender,
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              print(value);
              value = gender;
            });
          },
        ),
        Text('Woman'),
      ],
    );
  }

  Widget _emailField() {
    return TextFormField(
      validator: (val) {
        emailValid(val!);
      },
      controller: _emailController,
      decoration: InputDecoration(
          icon: Icon(Icons.email), labelText: 'Example@email.com'),
    );
  }

  Widget _birthField() {
    return Row();
  }

  Widget _mobileField() {
    return TextFormField(
      controller: _mobileController,
      decoration:
          InputDecoration(icon: Icon(Icons.phone), labelText: '(999) 999-9999'),
      inputFormatters: [
        MaskTextInputFormatter(
            mask: '(###) ###-####', filter: {"#": RegExp(r'[0-9]')})
      ],
    );
  }

  Widget _nationalityField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.flag),
        SizedBox(
          width: 10,
        ),
        Text('National'),
        SizedBox(
          width: 40,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: nationals[0],
            onChanged: (e) {
              e = nationals;
            },
            items: nationals
                .map((e) => DropdownMenuItem(
                      child: Text('$e'),
                      value: e,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _coruseField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.list_alt),
        SizedBox(
          width: 10,
        ),
        Text('Couses'),
        SizedBox(
          width: 40,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: coruses[0],
            onChanged: (e) {
              e = coruse;
            },
            items: coruses
                .map((e) => DropdownMenuItem(
                      child: Text('$e'),
                      value: e,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _imageField() {
    return Container(
      width: 50,
      height: 50,
      child: Icon(Icons.image),
    );
  }

  Widget _registerButton() {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          // {firstname,
          // lastname,
          // username,
          // password,
          // email,
          // gender,
          // mobile,
          // birth,
          // nationality,
          // course}
          // if (_passwordController.text == _confirmPasswordontroller.text) {
          //   String fistname = _fistnameController.text;
          //   String lastname = _lastnameController.text;
          //   String username = _usernameController.text;
          //   String password = _passwordController.text;
          //   String email = _emailController.text;
          //   String gender = this.gender;
          //   String mobile = _mobileController.text;
          //   String birth = this.birth;
          //   String national = this.national;
          //   String coruse = this.coruse;

          //   context.read<UserCubit>().createUser(
          //         fistname,
          //         lastname,
          //         username,
          //         password,
          //         email,
          //         gender,
          //         mobile,
          //         birth,
          //         national,
          //         coruse,
          //       );
          //}
        },
        child: Text('Register Button'),
      );
    });
  }

  bool emailValid(String value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regRxp = RegExp(pattern);
    return regRxp.hasMatch(value);
  }

  bool passValid(String value) {
    String pattern = r"^[A-Za-z0-9]{8}";
    RegExp regRxp = RegExp(pattern);
    return regRxp.hasMatch(value);
  }
}
