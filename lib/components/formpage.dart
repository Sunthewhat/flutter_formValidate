import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String name = '';
  String id = '';
  String email = '';
  bool _isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    bool validate(String email) {
      bool isvalid = EmailValidator.validate(email);
      setState(() {
        _isEmailValid = isvalid;
      });
      return isvalid;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Give me your info!!!"),
              const SizedBox(height: 20),
              TextField(
                onChanged: (text) {
                  setState(() {
                    name = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    id = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'ID',
                  hintText: 'Enter your ID',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
                child: _isEmailValid
                    ? const Text('')
                    : const Text(
                        'Please enter a valid email',
                        style: TextStyle(color: Colors.red),
                      ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    bool valid = validate(email);
                    if (valid) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Form Data'),
                            content: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 200,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text('Name: $name'),
                                  const SizedBox(height: 10),
                                  Text('ID: $id'),
                                  const SizedBox(height: 10),
                                  Text('Email: $email'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
