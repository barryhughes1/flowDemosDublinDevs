public inherited sharing class CurrencyConverterAction {

    @InvocableMethod(label='Convert Amounts to USD')
    public static FlowOutput[] convertAmount(List<Decimal> euroAmounts) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.exchangerate.host/latest');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        Map<String, Object> response = (Map<String, Object>) Json.deserializeUntyped(res.getBody());
        Map<String, Object> rates = (Map<String, Object>) response.get('rates');
        Decimal usd = (Decimal)rates.get('USD');

        FlowOutput[] results = new List<FlowOutput>();
        for (Decimal amount : euroAmounts) {
            results.add(new FlowOutput(amount * usd));
        }
        return results;
    }

    public class FlowOutput{
        @InvocableVariable public Decimal amount;
        public FlowOutput(Decimal amount) {this.amount = amount;}
      }
}