import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  _AddressSectionState createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Address",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text(
                        "Full Name",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(6.0),
                          border: OutlineInputBorder()),
                    )
                  ],
                )),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(6.0),
                        border: OutlineInputBorder()),
                  )
                ],
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text(
                        "Address",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(6.0),
                          border: OutlineInputBorder()),
                    )
                  ],
                )),
            FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text(
                        "District",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(6.0),
                          border: OutlineInputBorder()),
                    )
                  ],
                )),
            FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text(
                        "Pin Code",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextField(
                      maxLength: 6,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6.0),
                          border: OutlineInputBorder()),
                    )
                  ],
                )),
            FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(6.0),
                          border: OutlineInputBorder()),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
