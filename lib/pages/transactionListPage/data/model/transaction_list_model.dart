import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TransactionListModel extends Equatable {
  String amount;
  String counterPartyService;
  String date;
  String counterPartBankCode;
  String contractReference;
  String paymentReference;
  String counterPartyReference;
  String logourl;
  String drCr;
  String accountNumber;
  String accountName;
  String counterPartyAccountNumber;
  String counterPartyAccountName;
  String journalNarration;
  String counterPartyBankName;
  String counterPartySwitchCode;
  String narration;
  String source;
  String bankCode;
  String branchCode;
  String maker;
  String checker;
  String bankName;
  String id;

  TransactionListModel({
    required this.accountName,
    required this.accountNumber,
    required this.amount,
    required this.bankCode,
    required this.bankName,
    required this.branchCode,
    required this.checker,
    required this.contractReference,
    required this.counterPartBankCode,
    required this.counterPartyAccountName,
    required this.counterPartyAccountNumber,
    required this.counterPartyBankName,
    required this.counterPartyReference,
    required this.counterPartyService,
    required this.counterPartySwitchCode,
    required this.date,
    required this.drCr,
    required this.id,
    required this.journalNarration,
    required this.logourl,
    required this.maker,
    required this.narration,
    required this.paymentReference,
    required this.source,
  });

  Map<String, dynamic> toMap() => {
        'accountName': accountName,
        'accountNumber': accountNumber,
        'amount': amount,
        'bankCode': bankCode,
        'bankName': bankName,
        'branchCode': branchCode,
        'checker': checker,
        'contractReference': contractReference,
        'counterPartBankCode': counterPartBankCode,
        'counterPartyAccountName': counterPartyAccountName,
        'counterPartyAccountNumber': counterPartyAccountNumber,
        'counterPartyBankName': counterPartyBankName,
        'counterPartyReference': counterPartyReference,
        'counterPartyService': counterPartyService,
        'counterPartySwitchCode': counterPartySwitchCode,
        'date': date,
        'drCr': drCr,
        'id': id,
        'journalNarration': journalNarration,
        'logourl': logourl,
        'maker': maker,
        'narration': narration,
        'paymentReference': paymentReference,
        'source': source,
      };

  @override
  List<Object?> get props => [
        accountName,
        accountNumber,
        amount,
        bankCode,
        bankName,
        branchCode,
        checker,
        contractReference,
        counterPartBankCode,
        counterPartyAccountName,
        counterPartyAccountNumber,
        counterPartyBankName,
        counterPartyReference,
        counterPartyService,
        counterPartySwitchCode,
        date,
        drCr,
        id,
        journalNarration,
        logourl,
        maker,
        narration,
        paymentReference,
        source,
      ];

  static TransactionListModel fromMap(Map<String, dynamic> data) {
    return TransactionListModel(
      accountName: data['accountName'] as String,
      accountNumber: data['accountNumber'] as String,
      amount: data['trnAmount'] as String,
      bankCode: data['bankCode'] as String,
      bankName: data['bankName'] as String,
      branchCode: data['branchCode'] as String,
      checker: data['checker'] as String,
      counterPartBankCode: data['trnCounterpartyBankCode'] as String,
      contractReference: data['trnContractReference'] as String,
      counterPartyAccountName: data['counterPartyAccountName'] as String,
      counterPartyAccountNumber: data['counterPartyAccountNumber'] as String,
      counterPartyBankName: data['trnCounterPartyBankName'] as String,
      counterPartyReference: data['trnCounterPartyReference'] as String,
      counterPartyService: data['trnCounterPartyService'] as String,
      counterPartySwitchCode: data['ftCounterPartySwitchCode'] as String,
      date: data['trnDate'] as String,
      drCr: data['trnDrCr'] as String,
      id: data['trnId'] as String,
      journalNarration: data['journalNarration'] as String,
      logourl: data['logourl'] as String,
      maker: data['maker'] as String,
      narration: data['trnNarration'] as String,
      paymentReference: data['trnPaymentReference'] as String,
      source: data['source'] as String,
    );
  }
}
