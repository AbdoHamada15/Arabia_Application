import 'package:arabia_applicaltion/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedPolicy = 'medical';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        // Allow scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 90,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'My Policies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Policy Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPolicy = 'medical';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kbuttonColor, // Button color
                      textStyle: const TextStyle(
                        color: Colors.black, // Text color
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // Rounded corners
                      ),
                    ),
                    child: const Text('Medical'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPolicy = 'motor';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kbuttonColor, // Button color
                      textStyle: const TextStyle(
                        color: Colors.black, // Text color
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // Rounded corners
                      ),
                    ),
                    child: const Text('Motor'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Policy Details
              PolicyCard(policyType: _selectedPolicy),
            ],
          ),
        ),
      ),
    );
  }
}

class PolicyCard extends StatelessWidget {
  final String policyType;

  const PolicyCard({super.key, required this.policyType});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> policyData;

    if (policyType == 'medical') {
      policyData = {
        'policyNumber': '4012312390',
        'entityNumber': '7880808220',
        'entityName': 'Elm Almaknanah for IT',
        'product': 'Gold Medical SME @ 24',
        'effectiveDate': '06 Mar 2023',
        'cchiStatus': 'Active',
        'validFor': '129 days',
      };
    } else if (policyType == 'motor') {
      policyData = {
        // ... motor policy data
      };
    } else {
      policyData = {
        'policyNumber': 'N/A',
        'entityNumber': 'N/A',
        'entityName': 'N/A',
        'product': 'N/A',
        'effectiveDate': 'N/A',
        'cchiStatus': 'N/A',
        'validFor': 'N/A',
      };
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 128, 50, 50),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            policyType.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue, // Text color
            ),
          ),
          const SizedBox(height: 10),
          Text('Policy# ${policyData['policyNumber']}'),
          const SizedBox(height: 5),
          Text('Entity# ${policyData['entityNumber']}'),
          const SizedBox(height: 5),
          Text('Entity Name: ${policyData['entityName']}'),
          const SizedBox(height: 5),
          Text('Product: ${policyData['product']}'),
          const SizedBox(height: 5),
          Text('Effective Date: ${policyData['effectiveDate']}'),
          const SizedBox(height: 5),
          Text('CCHI Status: ${policyData['cchiStatus']}'),
          const SizedBox(height: 5),
          Text('Valid for: ${policyData['validFor']}'),
        ],
      ),
    );
  }
}
