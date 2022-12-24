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

    @isTest(SeeAllData=false)
    static void toCharStringDefault01() {
        System.assertEquals('A'.charAt(0), CharUtils.toChar('A', 'B'.charAt(0)));
        System.assertEquals('B'.charAt(0), CharUtils.toChar('', 'B'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void toIntValue01() {
        System.assertEquals(3, CharUtils.toIntValue('3'.charat(0)));
        try {
            CharUtils.toIntValue('A'.charat(0));
            System.assert(false, 'ここに来ちゃダメ');
        } catch (IllegalArgumentException ex) {
            System.assert(true);
        }
    }
}