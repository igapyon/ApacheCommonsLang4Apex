@isTest(SeeAllData=false)
private class CharUtilsTest {
    @isTest(SeeAllData=false)
    static void constructorTest01() {
        new CharUtils();
    }

    @isTest(SeeAllData=false)
    static void toCharString01() {
        System.assertEquals('A'.charAt(0), CharUtils.toChar('A'));
    }
}