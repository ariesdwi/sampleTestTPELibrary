// import 'package:flutter/material.dart';
// import 'package:tpe_account_management_sdk/tpe_account_management_sdk.dart';
// import 'package:tpe_component_sdk/components/modal/tpe_modal_confirmation.dart';

// class TpeOrganismCardBalanceAccount extends StatefulWidget {
//   const TpeOrganismCardBalanceAccount({super.key});

//   @override
//   State<TpeOrganismCardBalanceAccount> createState() =>
//       _TpeOrganismCardBalanceAccountState();
// }

// class _TpeOrganismCardBalanceAccountState
//     extends State<TpeOrganismCardBalanceAccount> {
//   bool? _favoriteAccount;
//   @override
//   void initState() {
//     super.initState();
//     // Set account pertama sebagai favorite default
//     _favoriteAccount = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     void setFavoriteAccount(bool isFavorite) {
//       setState(() {
//         _favoriteAccount = isFavorite;
//       });
//     }

//     return Scaffold(
//         appBar: AppBar(title: const Text('TPE Account Card Balance')),
//         body: TpeCardBalanceAccount(
//           onSetMainAccount: () {
//             showDialog(
//                 context: context,
//                 builder: (context) {
//                   return TpeModalConfirmation(
//                     'Set as Main Account',
//                     'Are you sure you want to set this account as your main account?',
//                     textButtonNo: 'No',
//                     textButtonYa: 'Yes',
//                     () {
//                       setFavoriteAccount(true);
//                       Navigator.of(context).pop();
//                     },
//                     () => Navigator.of(context).pop(),
//                   );
//                 });
//           },
//           isLoading: false,
//           data: AccountDataCardModel(
//               accountNumber: '1232321323123344',
//               shortName: 'Farischa',
//               currency: 'USD',
//               currentBalance: '10000030'),
//           isFavorite: _favoriteAccount ?? false,
//         ));
//   }
// }
