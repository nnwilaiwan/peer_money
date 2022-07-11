import 'package:flutter/material.dart';
import 'package:peer_money/screens/verifyCard/verifyCard.dart';

class TestVerifyCard extends StatefulWidget {
  @override
  State<TestVerifyCard> createState() => _TestVerifyCardState();
}

class _TestVerifyCardState extends State<TestVerifyCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          children: [
            Container(
              color: const Color(0xFFF5F5F5),
              child: VerifyCard().verifyCard(
                'assets/images/verify-1.jpg',
                'Verify You Identify',
                const Color(0xFF1783DC),
                'Complete Verification to gain\nfull access to your Peer account',
                'Vertify Me',
                press: null,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: const Color(0xFFF5F5F5),
              child: VerifyCard().verifyCardKYC(
                'assets/images/verify-kyc.png',
                'KYC Onprocess',
                const Color(0xFFFF9A1F),
                'Lorem ipsum dolor sit amet. Quo \nfugiat natus ex omnis dolores \net delectus animi qui dolor nobis',
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: const Color(0xFFF5F5F5),
              child: VerifyCard().verifyCard(
                'assets/images/verify-success.png',
                'Success',
                const Color(0xFF34A156),
                'Lorem ipsum dolor sit amet. Quo \nfugiat natus ex omnis dolores',
                'Click',
                press: null,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: const Color(0xFFF5F5F5),
              child: VerifyCard().verifyCard(
                'assets/images/verify-error.png',
                'Error',
                const Color(0xFFD82730),
                'Lorem ipsum dolor sit amet. Quo \nfugiat natus ex omnis dolores',
                'Vertify Me',
                press: null,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
