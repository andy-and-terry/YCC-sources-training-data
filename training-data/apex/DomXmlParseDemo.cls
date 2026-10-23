// Build and read XML with the Dom namespace.
public class DomXmlParseDemo {
    public static String buildXml() {
        Dom.Document doc = new Dom.Document();
        Dom.XmlNode root = doc.createRootElement('order', null, null);
        root.setAttribute('id', 'A-100');
        Dom.XmlNode item1 = root.addChildElement('item', null, null);
        item1.setAttribute('sku', 'X1');
        item1.addTextNode('Keyboard');
        Dom.XmlNode item2 = root.addChildElement('item', null, null);
        item2.setAttribute('sku', 'Y2');
        item2.addTextNode('Mouse');
        return doc.toXmlString();
    }

    public static void main() {
        String xml = buildXml();

        Dom.Document parsed = new Dom.Document();
        parsed.load(xml);
        Dom.XmlNode root = parsed.getRootElement();
        System.debug('root: ' + root.getName() + ' id=' + root.getAttributeValue('id', null));

        for (Dom.XmlNode child : root.getChildElements()) {
            System.debug(child.getAttributeValue('sku', null) + ' -> ' + child.getText());
        }
        System.debug('item count: ' + root.getChildElements().size());   // 2
    }
}
