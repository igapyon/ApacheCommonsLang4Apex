@isTest(SeeAllData=false)
private class CharUtilsTest {
    @isTest(SeeAllData=false)
    static void constructorTest01() {
        new CharUtils();
    }

    @isTest(SeeAllData=false)
    static void toCharString01() {
        System.assertEquals('A'.charAt(0), CharUtils.toChar('A'));
        System.assertEquals('B'.charAt(0), CharUtils.toChar('BA'));
        try {
            CharUtils.toChar(null);
            System.assert(false, 'ここに来ちゃダメ');
        } catch (IllegalArgumentException ex) {
            System.assert(true);
        }
        try {
            CharUtils.toChar('');
            System.assert(false, 'ここに来ちゃダメ');
        } catch (IllegalArgumentException ex) {
            System.assert(true);
        }
    }

    @isTest(SeeAllData=false)
    static void toCharStringDefault01() {
        System.assertEquals('X'.charAt(0), CharUtils.toChar(null, 'X'.charAt(0)));
        System.assertEquals('X'.charAt(0), CharUtils.toChar('', 'X'.charAt(0)));
        System.assertEquals('A'.charAt(0), CharUtils.toChar('', 'A'.charAt(0)));
        System.assertEquals('B'.charAt(0), CharUtils.toChar('', 'BA'.charAt(0)));
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

    @isTest(SeeAllData=false)
    static void toIntValueDefault01() {
        System.assertEquals(3, CharUtils.toIntValue('3'.charat(0), -1));
        System.assertEquals(-1, CharUtils.toIntValue('A'.charat(0), -1));
    }

    @isTest(SeeAllData=false)
    static void toString01() {
        System.assertEquals(' ', CharUtils.toString(' '.charAt(0)));
        System.assertEquals('A', CharUtils.toString('A'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void unicodeEscaped01() {
        System.assertEquals('\\u0020', CharUtils.unicodeEscaped(' '.charAt(0)));
        System.assertEquals('\\u0041', CharUtils.unicodeEscaped('A'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void isAscii01() {
        System.assertEquals(true, CharUtils.isAscii('a'.charAt(0)));
        System.assertEquals(true, CharUtils.isAscii('A'.charAt(0)));
        System.assertEquals(true, CharUtils.isAscii('3'.charAt(0)));
        System.assertEquals(true, CharUtils.isAscii('-'.charAt(0)));
        System.assertEquals(true, CharUtils.isAscii('\n'.charAt(0)));
        System.assertEquals(false, CharUtils.isAscii('愛'.charAt(0)));
    }

}