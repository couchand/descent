@isTest
private class CalculatorTest
{
    private static testMethod void area()
    {
        Decimal radius = 3;
        Decimal expected = 9 * MyMath.PI;
        Calculator calc = new Calculator();

        Test.startTest();

        Decimal actual = calc.area( radius );

        Test.stopTest();

        System.assertEqual( expected, actual, 'the area should be calculated' )
    }
}
