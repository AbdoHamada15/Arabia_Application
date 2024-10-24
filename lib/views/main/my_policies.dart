import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_style.dart';

class MyPoliciesScreen extends StatefulWidget {
  const MyPoliciesScreen({super.key});

  @override
  State<MyPoliciesScreen> createState() => _MyPoliciesScreenState();
}

class _MyPoliciesScreenState extends State<MyPoliciesScreen> {
  String _selectedPolicyType = 'Medical';
  final Map<String, dynamic> _medicalPolicyDetails = {
    'policyNumber': '4012312390',
    'entityNumber': '7880808220',
    'entityName': 'Elm Almaknanah for IT',
    'crNumber': '2011826671',
    'product': 'Gold Medical SME @ 24',
    'effectiveDate': DateTime(2023, 3, 6),
    'cchiStatus': 'Active',
    'validDays': 129,
  };
  final Map<String, dynamic> _motorPolicyDetails = {
    'policyNumber': '5012312390',
    'id': '2078808082',
    'name': 'Gamal Elsayed Azab Barakah',
    'sequence': '18266710',
    'brand': 'Toyota Camry 2021',
    'effectiveDate': DateTime(2023, 3, 6),
    'najmStatus': 'Active',
    'validDays': 218,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            'assets/logo.png',
            height: 90,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            'My Policies',
            style: styleCat2,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          _buildPolicyTypeButtons(),
          SizedBox(
            height: height * 0.01,
          ),
          _buildPolicyDetailsCard(),
        ],
      ),
    );
  }

  Widget _buildPolicyTypeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildPolicyTypeButton('Medical'),
        const SizedBox(width: 10),
        _buildPolicyTypeButton('Motor'),
      ],
    );
  }

  Widget _buildPolicyTypeButton(String type) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedPolicyType = type;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            _selectedPolicyType == type ? kbuttonColor : kcategoryColor2,
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        type,
        style: TextStyle(
          color: _selectedPolicyType == type ? kBackgroundColor : kcatFontColor,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildPolicyDetailsCard() {
    if (_selectedPolicyType == 'Medical') {
      return _buildMedicalCard();
    } else if (_selectedPolicyType == 'Motor') {
      return _buildMotorCard();
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildMedicalCard() {
    final double height = MediaQuery.of(context).size.height;
    return Card(
      color: kcategoryColor,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 19.0, right: 15, top: 13, bottom: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Medical SME',
                  style: styleMinCard,
                ),
                Text(
                  'Valid for',
                  style: styleMinCard,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Policy# ${_medicalPolicyDetails['policyNumber']} ',
                  style: styleMinCard2,
                ),
                Text(
                  '${_medicalPolicyDetails['validDays']} days',
                  style: styleMinCard2,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            _buildDetailRow('Entity#', _medicalPolicyDetails['entityNumber'],
                'Entity Name', _medicalPolicyDetails['entityName']),
            _buildDetailRow('CR#', _medicalPolicyDetails['crNumber'], 'Product',
                _medicalPolicyDetails['product']),
            _buildDetailRow(
                'Effective Date',
                DateFormat('dd MMM yyyy')
                    .format(_medicalPolicyDetails['effectiveDate']),
                'CCHI Status',
                _medicalPolicyDetails['cchiStatus']),
          ],
        ),
      ),
    );
  }

  Widget _buildMotorCard() {
    final double height = MediaQuery.of(context).size.height;
    return Card(
      color: kcategoryColor,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 19.0, right: 15, top: 13, bottom: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Motor Comprehensive',
                  style: styleMinCard,
                ),
                Text(
                  'Valid for',
                  style: styleMinCard,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Policy# ${_motorPolicyDetails['policyNumber']} ',
                  style: styleMinCard2,
                ),
                Text(
                  '${_motorPolicyDetails['validDays']} days',
                  style: styleMinCard2,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            _buildDetailRow('ID#', _motorPolicyDetails['id'], 'Name',
                _motorPolicyDetails['name']),
            _buildDetailRow('Sequence#', _motorPolicyDetails['sequence'],
                'Brand', _motorPolicyDetails['brand']),
            _buildDetailRow(
                'Effective Date',
                DateFormat('dd MMM yyyy')
                    .format(_motorPolicyDetails['effectiveDate']),
                'Najm Status',
                _motorPolicyDetails['najmStatus']),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
      String label1, String value1, String label2, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1, style: styleMinCard3),
              Text(value1, style: styleLabel11),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Align to the right
            children: [
              Text(label2, style: styleMinCard3),
              Text(value2, style: styleLabel11),
            ],
          ),
        ],
      ),
    );
  }
}
