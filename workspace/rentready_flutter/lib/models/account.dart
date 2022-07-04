class Account {
  String name = '';
  String accountNumber = '';
  String acctountId = '';
  String stateProvince = '';
  String address = '';
  String website = '';
  String phone = '';
  String email = '';

  Account(this.name, this.accountNumber, this.acctountId, this.stateProvince, this.address, this.website, this.email,
      this.phone);

  Account.fromJson(Map json)
      : name = json['name'] ?? '',
        accountNumber = json['accountnumber'] ?? '',
        acctountId = json['accountid'] ?? '',
        stateProvince = json['address1_stateorprovince'] ?? '',
        address = json['address1_composite'] ?? '',
        website = json['websiteurl'] ?? '',
        phone = json['telephone1'] ?? '',
        email = json['emailaddress1'] ?? '';
}
