/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the 'License'); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@isTest(SeeAllData=false)
private class StringUtilsTest {
    @isTest(SeeAllData=false)
    static void constructorTest01() {
        new StringUtils();
    }

    @isTest(SeeAllData=false)
    static void abbreviate2args() {
        System.assertEquals(null, StringUtils.abbreviate(null, 5));
        System.assertEquals('', StringUtils.abbreviate('', 4));
        System.assertEquals('abc...', StringUtils.abbreviate('abcdefg', 6));
        System.assertEquals('abcdefg', StringUtils.abbreviate('abcdefg', 7));
        System.assertEquals('abcdefg', StringUtils.abbreviate('abcdefg', 8));
        System.assertEquals('a...', StringUtils.abbreviate('abcdefg', 4));
        try {
            System.assertEquals('abcdefg', StringUtils.abbreviate('abcdefg', 3));
            System.assert(false, 'ここに入ってはダメ');
        } catch(IllegalArgumentException ex) {
            System.assert(true);
        }
    }

    @isTest(SeeAllData=false)
    static void abbreviate3argsSII() {
        System.assertEquals(null, StringUtils.abbreviate(null, 5, 5));
        System.assertEquals('', StringUtils.abbreviate('', 0, 4));
        System.assertEquals('abcdefg...', StringUtils.abbreviate('abcdefghijklmno', -1, 10));
        System.assertEquals('abcdefg...', StringUtils.abbreviate('abcdefghijklmno', 0, 10));
        System.assertEquals('abcdefg...', StringUtils.abbreviate('abcdefghijklmno', 1, 10));
        System.assertEquals('abcdefg...', StringUtils.abbreviate('abcdefghijklmno', 4, 10));
        System.assertEquals('...fghi...', StringUtils.abbreviate('abcdefghijklmno', 5, 10));
        System.assertEquals('...ghij...', StringUtils.abbreviate('abcdefghijklmno', 6, 10));
        System.assertEquals('...ijklmno', StringUtils.abbreviate('abcdefghijklmno', 8, 10));
        System.assertEquals('...ijklmno', StringUtils.abbreviate('abcdefghijklmno', 10, 10));
        System.assertEquals('...ijklmno', StringUtils.abbreviate('abcdefghijklmno', 12, 10));
        try {
            StringUtils.abbreviate('abcdefghij', 0, 3);
            System.assert(false, 'ここに入ってはダメ');
        } catch(IllegalArgumentException ex) {
            System.assert(true);
        }
        try {
            StringUtils.abbreviate('abcdefghij', 5, 6);
            System.assert(false, 'ここに入ってはダメ');
        } catch(IllegalArgumentException ex) {
            System.assert(true);
        }
    }

    @isTest(SeeAllData=false)
    static void abbreviate3argsSSI() {
        System.assertEquals(null, StringUtils.abbreviate(null, '...', 5));
        System.assertEquals('abcdefg', StringUtils.abbreviate('abcdefg', (String)null, 4));
        System.assertEquals('', StringUtils.abbreviate('', '...', 4));
        System.assertEquals('abcd.', StringUtils.abbreviate('abcdefg', '.', 5));
        System.assertEquals('abcdefg', StringUtils.abbreviate('abcdefg', '.', 7));
        System.assertEquals('abcdefg', StringUtils.abbreviate('abcdefg', '.', 8));
        System.assertEquals('ab..', StringUtils.abbreviate('abcdefg', '..', 4));
        System.assertEquals('a..', StringUtils.abbreviate('abcdefg', '..', 3));
        try {
            StringUtils.abbreviate('abcdefg', '..', 2);
            System.assert(false, 'ここに入ってはダメ');
        } catch(IllegalArgumentException ex) {
            System.assert(true);
        }
        try {
            StringUtils.abbreviate('abcdefg', '...', 3);
            System.assert(false, 'ここに入ってはダメ');
        } catch(IllegalArgumentException ex) {
            System.assert(true);
        }
    }
    
    @isTest(SeeAllData=false)
    static void abbreviate4args() {
        System.assertEquals(null, StringUtils.abbreviate(null, null, 5, 5));
/*
    * StringUtils.abbreviate('abcdefghijklmno', null, *, *)    = 'abcdefghijklmno'
    * StringUtils.abbreviate('', '...', 0, 4)                  = ''
    * StringUtils.abbreviate('abcdefghijklmno', '---', -1, 10) = 'abcdefg---'
    * StringUtils.abbreviate('abcdefghijklmno', ',', 0, 10)    = 'abcdefghi,'
    * StringUtils.abbreviate('abcdefghijklmno', ',', 1, 10)    = 'abcdefghi,'
    * StringUtils.abbreviate('abcdefghijklmno', ',', 2, 10)    = 'abcdefghi,'
    * StringUtils.abbreviate('abcdefghijklmno', '::', 4, 10)   = '::efghij::'
    * StringUtils.abbreviate('abcdefghijklmno', '...', 6, 10)  = '...ghij...'
    * StringUtils.abbreviate('abcdefghijklmno', '*', 9, 10)    = '*ghijklmno'
    * StringUtils.abbreviate('abcdefghijklmno', ''', 10, 10)   = ''ghijklmno'
    * StringUtils.abbreviate('abcdefghijklmno', '!', 12, 10)   = '!ghijklmno'
*/
        try {
            StringUtils.abbreviate('abcdefghij', 'abra', 0, 4);
            System.assert(false, 'ここに入ってはダメ');
        } catch(IllegalArgumentException ex) {
            System.assert(true);
        }
        try {
            StringUtils.abbreviate('abcdefghij', '...', 5, 6);
            System.assert(false, 'ここに入ってはダメ');
        } catch(IllegalArgumentException ex) {
            System.assert(true);
        }
    }

    @isTest(SeeAllData=false)
    static void abbreviateMiddle() {
        System.assertEquals(null, StringUtils.abbreviateMiddle(null, null, 0));
/*
    * StringUtils.abbreviateMiddle('abc', null, 0)      = 'abc'
    * StringUtils.abbreviateMiddle('abc', '.', 0)      = 'abc'
    * StringUtils.abbreviateMiddle('abc', '.', 3)      = 'abc'
    */
        System.assertEquals('ab.f', StringUtils.abbreviateMiddle('abcdef', '.', 4));
    }
    
    @isTest(SeeAllData=false)
    static void center2args() {
        System.assertEquals(null, StringUtils.center(null, 100));
/*
    *    = null
    * StringUtils.center('', 4)     = '    '
    * StringUtils.center('ab', -1)  = 'ab'
    * StringUtils.center('ab', 4)   = ' ab '
    * StringUtils.center('abcd', 2) = 'abcd'
    */
        System.assertEquals(' a  ', StringUtils.center('a', 4));
    }

    @isTest(SeeAllData=false)
    static void center3argsSII() {
        System.assertEquals(null, StringUtils.center(null, 3, ' '));
/*
    * StringUtils.center('', 4, ' ')     = '    '
    * StringUtils.center('ab', -1, ' ')  = 'ab'
    * StringUtils.center('ab', 4, ' ')   = ' ab '
    * StringUtils.center('abcd', 2, ' ') = 'abcd'
    * StringUtils.center('a', 4, ' ')    = ' a  '
    */
        System.assertEquals('yayy', StringUtils.center('a', 4, 'y'));
    }

    @isTest(SeeAllData=false)
    static void center3argsSIS() {
    /*
    * StringUtils.center(null, *, *)     = null
    * StringUtils.center('', 4, ' ')     = '    '
    * StringUtils.center('ab', -1, ' ')  = 'ab'
    * StringUtils.center('ab', 4, ' ')   = ' ab '
    * StringUtils.center('abcd', 2, ' ') = 'abcd'
    * StringUtils.center('a', 4, ' ')    = ' a  '
    * StringUtils.center('a', 4, 'yz')   = 'yayz'
    * StringUtils.center('abc', 7, null) = '  abc  '
    */
        System.assertEquals('  abc  ', StringUtils.center('abc', 7, ''));
    }

    @isTest(SeeAllData=false)
    static void chomp() {
/*
    * StringUtils.chomp(null)          = null
    * StringUtils.chomp('')            = ''
    * StringUtils.chomp('abc \r')      = 'abc '
    * StringUtils.chomp('abc\n')       = 'abc'
    * StringUtils.chomp('abc\r\n')     = 'abc'
    * StringUtils.chomp('abc\r\n\r\n') = 'abc\r\n'
    * StringUtils.chomp('abc\n\r')     = 'abc\n'
    */
        System.assertEquals('abc\n\rabc', StringUtils.chomp('abc\n\rabc'));
        System.assertEquals('', StringUtils.chomp('\r'));
        System.assertEquals('', StringUtils.chomp('\n'));
        System.assertEquals('', StringUtils.chomp('\r\n'));
    }

    @isTest(SeeAllData=false)
    static void compare2args() {
    /*
    * StringUtils.compare(null, null)   = 0
    * StringUtils.compare(null , 'a')   &lt; 0
    * StringUtils.compare('a', null)    &gt; 0
    * StringUtils.compare('abc', 'abc') = 0
    * StringUtils.compare('a', 'b')     &lt; 0
    * StringUtils.compare('b', 'a')     &gt; 0
    * StringUtils.compare('a', 'B')     &gt; 0
    */
        System.assert(StringUtils.compare('ab', 'abc') < 0);
    }

    @isTest(SeeAllData=false)
    static void compare3args() {
    /*
    * StringUtils.compare(null, null, *)     = 0
    * StringUtils.compare(null , 'a', true)  &lt; 0
    * StringUtils.compare(null , 'a', false) &gt; 0
    * StringUtils.compare('a', null, true)   &gt; 0
    * StringUtils.compare('a', null, false)  &lt; 0
    * StringUtils.compare('abc', 'abc', *)   = 0
    * StringUtils.compare('a', 'b', *)       &lt; 0
    * StringUtils.compare('b', 'a', *)       &gt; 0
    * StringUtils.compare('a', 'B', *)       &gt; 0
    * 
    */
        System.assert(StringUtils.compare('ab', 'abc', true) < 0);
    }
     
    @isTest(SeeAllData=false)
    static void compareIgnoreCase2args() {
    /*
    * StringUtils.compareIgnoreCase(null, null)   = 0
    * StringUtils.compareIgnoreCase(null , 'a')   &lt; 0
    * StringUtils.compareIgnoreCase('a', null)    &gt; 0
    * StringUtils.compareIgnoreCase('abc', 'abc') = 0
    * StringUtils.compareIgnoreCase('abc', 'ABC') = 0
    * StringUtils.compareIgnoreCase('a', 'b')     &lt; 0
    * StringUtils.compareIgnoreCase('b', 'a')     &gt; 0
    * StringUtils.compareIgnoreCase('a', 'B')     &lt; 0
    * StringUtils.compareIgnoreCase('A', 'b')     &lt; 0
    * StringUtils.compareIgnoreCase('ab', 'ABC')  &lt; 0
    */
    }

    @isTest(SeeAllData=false)
    static void compareIgnoreCase3args() {
    /*
    * StringUtils.compareIgnoreCase(null, null, *)     = 0
    * StringUtils.compareIgnoreCase(null , 'a', true)  &lt; 0
    * StringUtils.compareIgnoreCase(null , 'a', false) &gt; 0
    * StringUtils.compareIgnoreCase('a', null, true)   &gt; 0
    * StringUtils.compareIgnoreCase('a', null, false)  &lt; 0
    * StringUtils.compareIgnoreCase('abc', 'abc', *)   = 0
    * StringUtils.compareIgnoreCase('abc', 'ABC', *)   = 0
    * StringUtils.compareIgnoreCase('a', 'b', *)       &lt; 0
    * StringUtils.compareIgnoreCase('b', 'a', *)       &gt; 0
    * StringUtils.compareIgnoreCase('a', 'B', *)       &lt; 0
    * StringUtils.compareIgnoreCase('A', 'b', *)       &lt; 0
    * StringUtils.compareIgnoreCase('ab', 'abc', *)    &lt; 0
   global static Integer compareIgnoreCase(final String str1, final String str2, final Boolean nullIsLess) {
    */
    }
    
    @isTest(SeeAllData=false)
    static void contains() {
/*
    * StringUtils.contains(null, *)    = false
    * StringUtils.contains('', *)      = false
    * StringUtils.contains('abc', 'a') = true
    * StringUtils.contains('abc', 'z') = false
   global static Boolean contains(final String seq, final Integer searchChar) {
    */
    }

    @isTest(SeeAllData=false)
    static void defaultStringTest01() {
        System.assertEquals('', StringUtils.defaultString(null));
        System.assertEquals('', StringUtils.defaultString(''));
        System.assertEquals('bat', StringUtils.defaultString('bat'));
    }

    @isTest(SeeAllData=false)
    static void defaultStringTest02() {
        System.assertEquals('NULL', StringUtils.defaultString(null, 'NULL'));
        System.assertEquals('', StringUtils.defaultString('', 'NULL'));
        System.assertEquals('bat', StringUtils.defaultString('bat', 'NULL'));
    }

    @isTest(SeeAllData=false)
    static void endsWith2args() {
    /*
    * StringUtils.endsWith(null, null)      = true
    * StringUtils.endsWith(null, 'def')     = false
    * StringUtils.endsWith('abcdef', null)  = false
    * StringUtils.endsWith('abcdef', 'def') = true
    * StringUtils.endsWith('ABCDEF', 'def') = false
    * StringUtils.endsWith('ABCDEF', 'cde') = false
    * StringUtils.endsWith('ABCDEF', '')    = true
   global static Boolean endsWith(final String str, final String suffix) {
    */
    }

    @isTest(SeeAllData=false)
    static void endsWith3args() {
//        private static Boolean endsWith(final String str, final String suffix, final Boolean ignoreCase) {
    }

    @isTest(SeeAllData=false)
    static void equals2args() {
/*
        * StringUtils.equals(null, null)   = true
        * StringUtils.equals(null, 'abc')  = false
        * StringUtils.equals('abc', null)  = false
        * StringUtils.equals('abc', 'abc') = true
        * StringUtils.equals('abc', 'ABC') = false
       global static Boolean equals(final String cs1, final String cs2) {
*/
}
    
    @isTest(SeeAllData=false)
    static void equalsIgnoreCase2args() {
    /*     * StringUtils.equalsIgnoreCase(null, null)   = true
     * StringUtils.equalsIgnoreCase(null, 'abc')  = false
     * StringUtils.equalsIgnoreCase('abc', null)  = false
     * StringUtils.equalsIgnoreCase('abc', 'abc') = true
     * StringUtils.equalsIgnoreCase('abc', 'ABC') = true
    global static Boolean equalsIgnoreCase(final String cs1, final String cs2) {
        */
    }


    @isTest(SeeAllData=false)
    static void getDigits() {
/*     * StringUtils.getDigits(null)  = null
     * StringUtils.getDigits('')    = ''
     * StringUtils.getDigits('abc') = ''
     * StringUtils.getDigits('1000$') = '1000'
     * StringUtils.getDigits('1123~45') = '112345'
     * StringUtils.getDigits('(541) 754-3010') = '5417543010'
     * StringUtils.getDigits('\u0967\u0968\u0969') = '\u0967\u0968\u0969'
    global static String getDigits(final String str) {
*/
    }

    @isTest(SeeAllData=false)
    static void indexOf2args() {
    /*
     * StringUtils.indexOf(null, *)          = -1
     * StringUtils.indexOf(*, null)          = -1
     * StringUtils.indexOf('', '')           = 0
     * StringUtils.indexOf('', *)            = -1 (except when * = '')
     * StringUtils.indexOf('aabaabaa', 'a')  = 0
     * StringUtils.indexOf('aabaabaa', 'b')  = 2
     * StringUtils.indexOf('aabaabaa', 'ab') = 1
     * StringUtils.indexOf('aabaabaa', '')   = 0
    global static Integer indexOf(final String seq, final String searchSeq) {
        */
    }
    

    @isTest(SeeAllData=false)
    static void indexOf2args2() {
/*     * StringUtils.indexOf(null, *)         = -1
     * StringUtils.indexOf('', *)           = -1
     * StringUtils.indexOf('aabaabaa', 'a') = 0
     * StringUtils.indexOf('aabaabaa', 'b') = 2
    global static Integer indexOf(final String seq, final Integer searchChar) {
        */
    }
    
    @isTest(SeeAllData=false)
    static void isAllLowerCase() {
/*
     * StringUtils.isAllLowerCase(null)   = false
     * StringUtils.isAllLowerCase('')     = false
     * StringUtils.isAllLowerCase('  ')   = false
     * StringUtils.isAllLowerCase('abc')  = true
     * StringUtils.isAllLowerCase('abC')  = false
     * StringUtils.isAllLowerCase('ab c') = false
     * StringUtils.isAllLowerCase('ab1c') = false
     * StringUtils.isAllLowerCase('ab/c') = false
    global static Boolean isAllLowerCase(final String cs) {
        */
    }
    
    @isTest(SeeAllData=false)
    static void isAllUpperCase() {
/*
     * StringUtils.isAllUpperCase(null)   = false
     * StringUtils.isAllUpperCase('')     = false
     * StringUtils.isAllUpperCase('  ')   = false
     * StringUtils.isAllUpperCase('ABC')  = true
     * StringUtils.isAllUpperCase('aBC')  = false
     * StringUtils.isAllUpperCase('A C')  = false
     * StringUtils.isAllUpperCase('A1C')  = false
     * StringUtils.isAllUpperCase('A/C')  = false
    global static Boolean isAllUpperCase(final String cs) {
        */
    }
    

    @isTest(SeeAllData=false)
    static void isAlpha() {
/*     * StringUtils.isAlpha(null)   = false
     * StringUtils.isAlpha('')     = false
     * StringUtils.isAlpha('  ')   = false
     * StringUtils.isAlpha('abc')  = true
     * StringUtils.isAlpha('ab2c') = false
     * StringUtils.isAlpha('ab-c') = false
    global static Boolean isAlpha(final String cs) {
*/  }
    
    @isTest(SeeAllData=false)
    static void isAlphanumeric() {
/*     * StringUtils.isAlphanumeric(null)   = false
     * StringUtils.isAlphanumeric('')     = false
     * StringUtils.isAlphanumeric('  ')   = false
     * StringUtils.isAlphanumeric('abc')  = true
     * StringUtils.isAlphanumeric('ab c') = false
     * StringUtils.isAlphanumeric('ab2c') = true
     * StringUtils.isAlphanumeric('ab-c') = false
    global static Boolean isAlphanumeric(final String cs) {
*/  
    }
    
    @isTest(SeeAllData=false)
    static void isAnyBlankTest() {
        System.assertEquals(true, StringUtils.isAnyBlank((String) null));
        //* StringUtils.isAnyBlank((String[]) null)  = false
        System.assertEquals(true, StringUtils.isAnyBlank(null, 'foo'));
        System.assertEquals(true, StringUtils.isAnyBlank(null, null));
        System.assertEquals(true, StringUtils.isAnyBlank('', 'bar'));
        System.assertEquals(true, StringUtils.isAnyBlank('bob', ''));
        System.assertEquals(true, StringUtils.isAnyBlank('  bob  ', null));
        System.assertEquals(true, StringUtils.isAnyBlank(' ', 'bar'));
        //* StringUtils.isAnyBlank(new String[] {})  = false
        //* StringUtils.isAnyBlank(new String[]{''}) = true
        System.assertEquals(false, StringUtils.isAnyBlank('foo', 'bar'));
     }

    @isTest(SeeAllData=false)
    static void isAnyEmpty() {
/*     * StringUtils.isAnyEmpty((String) null)    = true
     * StringUtils.isAnyEmpty((String[]) null)  = false
     * StringUtils.isAnyEmpty(null, 'foo')      = true
     * StringUtils.isAnyEmpty('', 'bar')        = true
     * StringUtils.isAnyEmpty('bob', '')        = true
     * StringUtils.isAnyEmpty('  bob  ', null)  = true
     * StringUtils.isAnyEmpty(' ', 'bar')       = false
     * StringUtils.isAnyEmpty('foo', 'bar')     = false
     * StringUtils.isAnyEmpty(new String[]{})   = false
     * StringUtils.isAnyEmpty(new String[]{''}) = true
    global static Boolean isAnyEmpty(final String cs1, String cs2) {
*/     
    }
 
    @isTest(SeeAllData=false)
    static void isAsciiPrintable() {
/*     * StringUtils.isAsciiPrintable(null)     = false
     * StringUtils.isAsciiPrintable('')       = true
     * StringUtils.isAsciiPrintable(' ')      = true
     * StringUtils.isAsciiPrintable('Ceki')   = true
     * StringUtils.isAsciiPrintable('ab2c')   = true
     * StringUtils.isAsciiPrintable('!ab-c~') = true
     * StringUtils.isAsciiPrintable('\u0020') = true
     * StringUtils.isAsciiPrintable('\u0021') = true
     * StringUtils.isAsciiPrintable('\u007e') = true
     * StringUtils.isAsciiPrintable('\u007f') = false
     * StringUtils.isAsciiPrintable('Ceki G\u00fclc\u00fc') = false
    global static Boolean isAsciiPrintable(final String cs) {
*/   
    }

    @isTest(SeeAllData=false)
    static void isBlankTest01() {
        System.assertEquals(true, StringUtils.isBlank(null));
        System.assertEquals(true, StringUtils.isBlank(''));
        System.assertEquals(true, StringUtils.isBlank(' '));
        System.assertEquals(false, StringUtils.isBlank('bob'));
        System.assertEquals(false, StringUtils.isBlank('  bob  '));
    }

    @isTest(SeeAllData=false)
    static void isEmpty() {
/*    * StringUtils.isEmpty(null)      = true
    * StringUtils.isEmpty('')        = true
    * StringUtils.isEmpty(' ')       = false
    * StringUtils.isEmpty('bob')     = false
    * StringUtils.isEmpty('  bob  ') = false
   global static Boolean isEmpty(final String cs) {
*/    
    }

    @isTest(SeeAllData=false)
    static void isMixedCase() {
/*
    * StringUtils.isMixedCase(null)    = false
    * StringUtils.isMixedCase('')      = false
    * StringUtils.isMixedCase('ABC')   = false
    * StringUtils.isMixedCase('abc')   = false
    * StringUtils.isMixedCase('aBc')   = true
    * StringUtils.isMixedCase('A c')   = true
    * StringUtils.isMixedCase('A1c')   = true
    * StringUtils.isMixedCase('a/C')   = true
    * StringUtils.isMixedCase('aC\t')  = true
   global static Boolean isMixedCase(final String cs) {
*/    
    }

    @isTest(SeeAllData=false)
    static void isNonBlankTest() {
        System.assertEquals(false, StringUtils.isNoneBlank((String) null));
        //* StringUtils.isNoneBlank((String[]) null)  = true
        System.assertEquals(false, StringUtils.isNoneBlank(null, 'foo'));
        System.assertEquals(false, StringUtils.isNoneBlank(null, null));
        System.assertEquals(false, StringUtils.isNoneBlank('', 'bar'));
        System.assertEquals(false, StringUtils.isNoneBlank('bob', ''));
        System.assertEquals(false, StringUtils.isNoneBlank('  bob  ', null));
        System.assertEquals(false, StringUtils.isNoneBlank(' ', 'bar'));
        //* StringUtils.isNoneBlank(new String[] {})  = true
        //* StringUtils.isNoneBlank(new String[]{''}) = false
        System.assertEquals(true, StringUtils.isNoneBlank('foo', 'bar'));
    }

    @isTest(SeeAllData=false)
    static void isNotBlank() {
/*
    * StringUtils.isNotBlank(null)      = false
    * StringUtils.isNotBlank('')        = false
    * StringUtils.isNotBlank(' ')       = false
    * StringUtils.isNotBlank('bob')     = true
    * StringUtils.isNotBlank('  bob  ') = true
   global static Boolean isNotBlank(final String cs) {
*/    
    }


    @isTest(SeeAllData=false)
    static void isNotEmpty() {
    /*
    * StringUtils.isNotEmpty(null)      = false
    * StringUtils.isNotEmpty('')        = false
    * StringUtils.isNotEmpty(' ')       = true
    * StringUtils.isNotEmpty('bob')     = true
    * StringUtils.isNotEmpty('  bob  ') = true
   global static Boolean isNotEmpty(final String cs) {
*/    
    }

    @isTest(SeeAllData=false)
    static void isNumeric() {
/*
    StringUtils.isNumeric(null)   = false
     * StringUtils.isNumeric('')     = false
     * StringUtils.isNumeric('  ')   = false
     * StringUtils.isNumeric('123')  = true
     * StringUtils.isNumeric('\u0967\u0968\u0969')  = true
     * StringUtils.isNumeric('12 3') = false
     * StringUtils.isNumeric('ab2c') = false
     * StringUtils.isNumeric('12-3') = false
     * StringUtils.isNumeric('12.3') = false
     * StringUtils.isNumeric('-123') = false
     * StringUtils.isNumeric('+123') = false
    global static Boolean isNumeric(final String cs) {
*/    
    }

    @isTest(SeeAllData=false)
    static void isWhitespace() {
/*        StringUtils.isWhitespace(null)   = false
     * StringUtils.isWhitespace('')     = true
     * StringUtils.isWhitespace('  ')   = true
     * StringUtils.isWhitespace('abc')  = false
     * StringUtils.isWhitespace('ab2c') = false
     * StringUtils.isWhitespace('ab-c') = false
    global static Boolean isWhitespace(final String cs) {
*/    
    }
    
        @isTest(SeeAllData=false)
        static void lastIndexOf2args1() {
    /*    StringUtils.lastIndexOf(null, *)          = -1
     * StringUtils.lastIndexOf(*, null)          = -1
     * StringUtils.lastIndexOf('', '')           = 0
     * StringUtils.lastIndexOf('aabaabaa', 'a')  = 7
     * StringUtils.lastIndexOf('aabaabaa', 'b')  = 5
     * StringUtils.lastIndexOf('aabaabaa', 'ab') = 4
     * StringUtils.lastIndexOf('aabaabaa', '')   = 8
    global static Integer lastIndexOf(final String seq, final String searchSeq) {*/
        }
    

        @isTest(SeeAllData=false)
        static void lastIndexOf3args() {
/*
     * StringUtils.lastIndexOf(null, *, *)          = -1
     * StringUtils.lastIndexOf(*, null, *)          = -1
     * StringUtils.lastIndexOf('aabaabaa', 'a', 8)  = 7
     * StringUtils.lastIndexOf('aabaabaa', 'b', 8)  = 5
     * StringUtils.lastIndexOf('aabaabaa', 'ab', 8) = 4
     * StringUtils.lastIndexOf('aabaabaa', 'b', 9)  = 5
     * StringUtils.lastIndexOf('aabaabaa', 'b', -1) = -1
     * StringUtils.lastIndexOf('aabaabaa', 'a', 0)  = 0
     * StringUtils.lastIndexOf('aabaabaa', 'b', 0)  = -1
     * StringUtils.lastIndexOf('aabaabaa', 'b', 1)  = -1
     * StringUtils.lastIndexOf('aabaabaa', 'b', 2)  = 2
     * StringUtils.lastIndexOf('aabaabaa', 'ba', 2)  = 2
    global static Integer lastIndexOf(final String seq, final String searchSeq, final Integer startPos) {
    */
        }
    


    @isTest(SeeAllData=false)
    static void lastIndexOf2args2() {
/*        StringUtils.lastIndexOf(null, *)         = -1
     * StringUtils.lastIndexOf('', *)           = -1
     * StringUtils.lastIndexOf('aabaabaa', 'a') = 7
     * StringUtils.lastIndexOf('aabaabaa', 'b') = 5
    global static Integer lastIndexOf(final String seq, final Integer searchChar) {
*/    }
    
    @isTest(SeeAllData=false)
    static void left2args() {
/*        StringUtils.left(null, *)    = null
     * StringUtils.left(*, -ve)     = ''
     * StringUtils.left('', *)      = ''
     * StringUtils.left('abc', 0)   = ''
     * StringUtils.left('abc', 2)   = 'ab'
     * StringUtils.left('abc', 4)   = 'abc'
    global static String left(final String str, final Integer len) {
*/    }
    

    @isTest(SeeAllData=false)
    static void leftPad2args() {
/*     * StringUtils.leftPad(null, *)   = null
     * StringUtils.leftPad('', 3)     = '   '
     * StringUtils.leftPad('bat', 3)  = 'bat'
     * StringUtils.leftPad('bat', 5)  = '  bat'
     * StringUtils.leftPad('bat', 1)  = 'bat'
     * StringUtils.leftPad('bat', -1) = 'bat'
    global static String leftPad(final String str, final Integer size) {*/    
    }
    
    @isTest(SeeAllData=false)
    static void leftPad() {
/*        StringUtils.leftPad(null, *, *)     = null
     * StringUtils.leftPad('', 3, 'z')     = 'zzz'
     * StringUtils.leftPad('bat', 3, 'z')  = 'bat'
     * StringUtils.leftPad('bat', 5, 'z')  = 'zzbat'
     * StringUtils.leftPad('bat', 1, 'z')  = 'bat'
     * StringUtils.leftPad('bat', -1, 'z') = 'bat'
    global static String leftPad(final String str, final Integer size, final Integer/*char padChar) {
    */
    }
    
    @isTest(SeeAllData=false)
    static void leftPad3args() {
/*        StringUtils.leftPad(null, *, *)      = null
     * StringUtils.leftPad('', 3, 'z')      = 'zzz'
     * StringUtils.leftPad('bat', 3, 'yz')  = 'bat'
     * StringUtils.leftPad('bat', 5, 'yz')  = 'yzbat'
     * StringUtils.leftPad('bat', 8, 'yz')  = 'yzyzybat'
     * StringUtils.leftPad('bat', 1, 'yz')  = 'bat'
     * StringUtils.leftPad('bat', -1, 'yz') = 'bat'
     * StringUtils.leftPad('bat', 5, null)  = '  bat'
     * StringUtils.leftPad('bat', 5, '')    = '  bat'
    global static String leftPad(final String str, final Integer size, String padStr) {
*/   
    }
    
    @isTest(SeeAllData=false)
    static void length1arg() {
//        global static Integer length(final String cs) {
    }


    @isTest(SeeAllData=false)
    static void lowerCase() {
        /*     * StringUtils.lowerCase(null)  = null
     * StringUtils.lowerCase('')    = ''
     * StringUtils.lowerCase('aBc') = 'abc'
    global static String lowerCase(final String str) {
*/    
    }

    @isTest(SeeAllData=false)
    static void mid() {
/*     * StringUtils.mid(null, *, *)    = null
     * StringUtils.mid(*, *, -ve)     = ''
     * StringUtils.mid('', 0, *)      = ''
     * StringUtils.mid('abc', 0, 2)   = 'ab'
     * StringUtils.mid('abc', 0, 4)   = 'abc'
     * StringUtils.mid('abc', 2, 4)   = 'c'
     * StringUtils.mid('abc', 4, 2)   = ''
     * StringUtils.mid('abc', -2, 2)  = 'ab'
    global static String mid(final String str, Integer pos, final Integer len) {
*/  
    }

    @isTest(SeeAllData=false)
    static void repeat2args() {
/*     * StringUtils.repeat(null, 2) = null
     * StringUtils.repeat('', 0)   = ''
     * StringUtils.repeat('', 2)   = ''
     * StringUtils.repeat('a', 3)  = 'aaa'
     * StringUtils.repeat('ab', 2) = 'abab'
     * StringUtils.repeat('a', -2) = ''
    global static String repeat(final String str, final Integer repeat) {
*/
    }    

    @isTest(SeeAllData=false)
    static void right2args() {
     /*   * StringUtils.right(null, *)    = null
        * StringUtils.right(*, -ve)     = ''
        * StringUtils.right('', *)      = ''
        * StringUtils.right('abc', 0)   = ''
        * StringUtils.right('abc', 2)   = 'bc'
        * StringUtils.right('abc', 4)   = 'abc'
       global static String right(final String str, final Integer len) {
*/
    }

    @isTest(SeeAllData=false)
    static void rightPad2args() {
/*     * StringUtils.rightPad(null, *)   = null
     * StringUtils.rightPad('', 3)     = '   '
     * StringUtils.rightPad('bat', 3)  = 'bat'
     * StringUtils.rightPad('bat', 5)  = 'bat  '
     * StringUtils.rightPad('bat', 1)  = 'bat'
     * StringUtils.rightPad('bat', -1) = 'bat'
    global static String rightPad(final String str, final Integer size) {
*/
    }
    
    @isTest(SeeAllData=false)
    static void rightPad3args() {
/*        StringUtils.rightPad(null, *, *)     = null
     * StringUtils.rightPad('', 3, 'z')     = 'zzz'
     * StringUtils.rightPad('bat', 3, 'z')  = 'bat'
     * StringUtils.rightPad('bat', 5, 'z')  = 'batzz'
     * StringUtils.rightPad('bat', 1, 'z')  = 'bat'
     * StringUtils.rightPad('bat', -1, 'z') = 'bat'
    global static String rightPad(final String str, final Integer size, final Integer padChar) {
   */  
    }

    @isTest(SeeAllData=false)
    static void rightPad3args2() {
/*     * StringUtils.rightPad(null, *, *)      = null
     * StringUtils.rightPad('', 3, 'z')      = 'zzz'
     * StringUtils.rightPad('bat', 3, 'yz')  = 'bat'
     * StringUtils.rightPad('bat', 5, 'yz')  = 'batyz'
     * StringUtils.rightPad('bat', 8, 'yz')  = 'batyzyzy'
     * StringUtils.rightPad('bat', 1, 'yz')  = 'bat'
     * StringUtils.rightPad('bat', -1, 'yz') = 'bat'
     * StringUtils.rightPad('bat', 5, null)  = 'bat  '
     * StringUtils.rightPad('bat', 5, '')    = 'bat  '
    global static String rightPad(final String str, final Integer size, String padStr) {
*/    
    }

    @isTest(SeeAllData=false)
    static void rotate2args() {
/*        StringUtils.rotate(null, *)        = null
     * StringUtils.rotate('', *)          = ''
     * StringUtils.rotate('abcdefg', 0)   = 'abcdefg'
     * StringUtils.rotate('abcdefg', 2)   = 'fgabcde'
     * StringUtils.rotate('abcdefg', -2)  = 'cdefgab'
     * StringUtils.rotate('abcdefg', 7)   = 'abcdefg'
     * StringUtils.rotate('abcdefg', -7)  = 'abcdefg'
     * StringUtils.rotate('abcdefg', 9)   = 'fgabcde'
     * StringUtils.rotate('abcdefg', -9)  = 'cdefgab'
    global static String rotate(final String str, final Integer shift) {
*/    
    }

    @isTest(SeeAllData=false)
    static void startsWith2args() {
/*        StringUtils.startsWith(null, null)      = true
     * StringUtils.startsWith(null, 'abc')     = false
     * StringUtils.startsWith('abcdef', null)  = false
     * StringUtils.startsWith('abcdef', 'abc') = true
     * StringUtils.startsWith('ABCDEF', 'abc') = false
    global static Boolean startsWith(final String str, final String prefix) {
*/
    }

    @isTest(SeeAllData=false)
    static void startsWith() {
//        private static Boolean startsWith(final String str, final String prefix, final Boolean ignoreCase) {
    }

    @isTest(SeeAllData=false)
    static void substring2arg() {
/*            StringUtils.substring(null, *)   = null
     * StringUtils.substring('', *)     = ''
     * StringUtils.substring('abc', 0)  = 'abc'
     * StringUtils.substring('abc', 2)  = 'c'
     * StringUtils.substring('abc', 4)  = ''
     * StringUtils.substring('abc', -2) = 'bc'
     * StringUtils.substring('abc', -4) = 'abc'
    global static String substring(final String str, Integer start) {
*/  
    }
        
    @isTest(SeeAllData=false)
    static void substring3args() {
/*        StringUtils.substring(null, *, *)    = null
     * StringUtils.substring('', * ,  *)    = '';
     * StringUtils.substring('abc', 0, 2)   = 'ab'
     * StringUtils.substring('abc', 2, 0)   = ''
     * StringUtils.substring('abc', 2, 4)   = 'c'
     * StringUtils.substring('abc', 4, 6)   = ''
     * StringUtils.substring('abc', 2, 2)   = ''
     * StringUtils.substring('abc', -2, -1) = 'b'
     * StringUtils.substring('abc', -4, 2)  = 'ab'
    global static String substring(final String str, Integer start, Integer end1) {
*/    
    }
    
    @isTest(SeeAllData=false)
    static void trim() {
/*        StringUtils.trim(null)          = null
     * StringUtils.trim('')            = ''
     * StringUtils.trim('     ')       = ''
     * StringUtils.trim('abc')         = 'abc'
     * StringUtils.trim('    abc    ') = 'abc'
    global static String trim(final String str) {
*/    
    }

    @isTest(SeeAllData=false)
    static void trimToEmpty() {
/*        StringUtils.trimToEmpty(null)          = ''
     * StringUtils.trimToEmpty('')            = ''
     * StringUtils.trimToEmpty('     ')       = ''
     * StringUtils.trimToEmpty('abc')         = 'abc'
     * StringUtils.trimToEmpty('    abc    ') = 'abc'
    global static String trimToEmpty(final String str) {
*/        
    }
    

    @isTest(SeeAllData=false)
    static void trimToNull() {
/*        StringUtils.trimToNull(null)          = null
     * StringUtils.trimToNull('')            = null
     * StringUtils.trimToNull('     ')       = null
     * StringUtils.trimToNull('abc')         = 'abc'
     * StringUtils.trimToNull('    abc    ') = 'abc'
    global static String trimToNull(final String str) {
*/        
    }

    @isTest(SeeAllData=false)
    static void truncate2args() {
/*        StringUtils.truncate(null, 0)       = null
     * StringUtils.truncate(null, 2)       = null
     * StringUtils.truncate('', 4)         = ''
     * StringUtils.truncate('abcdefg', 4)  = 'abcd'
     * StringUtils.truncate('abcdefg', 6)  = 'abcdef'
     * StringUtils.truncate('abcdefg', 7)  = 'abcdefg'
     * StringUtils.truncate('abcdefg', 8)  = 'abcdefg'
     * StringUtils.truncate('abcdefg', -1) = throws an IllegalArgumentException
    global static String truncate(final String str, final Integer maxWidth) {
*/    
    }
    
    @isTest(SeeAllData=false)
    static void truncate3args() {
/*        StringUtils.truncate(null, 0, 0) = null
        * StringUtils.truncate(null, 2, 4) = null
        * StringUtils.truncate('', 0, 10) = ''
        * StringUtils.truncate('', 2, 10) = ''
        * StringUtils.truncate('abcdefghij', 0, 3) = 'abc'
        * StringUtils.truncate('abcdefghij', 5, 6) = 'fghij'
        * StringUtils.truncate('raspberry peach', 10, 15) = 'peach'
        * StringUtils.truncate('abcdefghijklmno', 0, 10) = 'abcdefghij'
        * StringUtils.truncate('abcdefghijklmno', -1, 10) = throws an IllegalArgumentException
        * StringUtils.truncate('abcdefghijklmno', Integer.MIN_VALUE, 10) = throws an IllegalArgumentException
        * StringUtils.truncate('abcdefghijklmno', Integer.MIN_VALUE, Integer.MAX_VALUE) = throws an IllegalArgumentException
        * StringUtils.truncate('abcdefghijklmno', 0, Integer.MAX_VALUE) = 'abcdefghijklmno'
        * StringUtils.truncate('abcdefghijklmno', 1, 10) = 'bcdefghijk'
        * StringUtils.truncate('abcdefghijklmno', 2, 10) = 'cdefghijkl'
        * StringUtils.truncate('abcdefghijklmno', 3, 10) = 'defghijklm'
        * StringUtils.truncate('abcdefghijklmno', 4, 10) = 'efghijklmn'
        * StringUtils.truncate('abcdefghijklmno', 5, 10) = 'fghijklmno'
        * StringUtils.truncate('abcdefghijklmno', 5, 5) = 'fghij'
        * StringUtils.truncate('abcdefghijklmno', 5, 3) = 'fgh'
        * StringUtils.truncate('abcdefghijklmno', 10, 3) = 'klm'
        * StringUtils.truncate('abcdefghijklmno', 10, Integer.MAX_VALUE) = 'klmno'
        * StringUtils.truncate('abcdefghijklmno', 13, 1) = 'n'
        * StringUtils.truncate('abcdefghijklmno', 13, Integer.MAX_VALUE) = 'no'
        * StringUtils.truncate('abcdefghijklmno', 14, 1) = 'o'
        * StringUtils.truncate('abcdefghijklmno', 14, Integer.MAX_VALUE) = 'o'
        * StringUtils.truncate('abcdefghijklmno', 15, 1) = ''
        * StringUtils.truncate('abcdefghijklmno', 15, Integer.MAX_VALUE) = ''
        * StringUtils.truncate('abcdefghijklmno', Integer.MAX_VALUE, Integer.MAX_VALUE) = ''
        * StringUtils.truncate('abcdefghij', 3, -1) = throws an IllegalArgumentException
        * StringUtils.truncate('abcdefghij', -2, 4) = throws an IllegalArgumentException
       global static String truncate(final String str, final Integer offset, final Integer maxWidth) {
  */    
    }
  
    @isTest(SeeAllData=false)
    static void unwrap2args1() {
/*        StringUtils.unwrap(null, null)         = null
     * StringUtils.unwrap(null, '\0')         = null
     * StringUtils.unwrap(null, '1')          = null
     * StringUtils.unwrap('a', 'a')           = 'a'
     * StringUtils.unwrap('aa', 'a')           = ''
     * StringUtils.unwrap('\'abc\'', '\'')    = 'abc'
     * StringUtils.unwrap('AABabcBAA', 'A')   = 'ABabcBA'
     * StringUtils.unwrap('A', '#')           = 'A'
     * StringUtils.unwrap('#A', '#')          = '#A'
     * StringUtils.unwrap('A#', '#')          = 'A#'
    global static String unwrap(final String str, final Integer wrapChar) {
*/
    }

    @isTest(SeeAllData=false)
    static void unwrap2args2() {
/*        StringUtils.unwrap(null, null)         = null
     * StringUtils.unwrap(null, '')           = null
     * StringUtils.unwrap(null, '1')          = null
     * StringUtils.unwrap('a', 'a')           = 'a'
     * StringUtils.unwrap('aa', 'a')          = ''
     * StringUtils.unwrap('\'abc\'', '\'')    = 'abc'
     * StringUtils.unwrap('\'abc\'', '\'')    = 'abc'
     * StringUtils.unwrap('AABabcBAA', 'AA')  = 'BabcB'
     * StringUtils.unwrap('A', '#')           = 'A'
     * StringUtils.unwrap('#A', '#')          = '#A'
     * StringUtils.unwrap('A#', '#')          = 'A#'
    global static String unwrap(final String str, final String wrapToken) {
*/
    }
    
    @isTest(SeeAllData=false)
    static void upperCase() {
/*        StringUtils.upperCase(null)  = null
     * StringUtils.upperCase('')    = ''
     * StringUtils.upperCase('aBc') = 'ABC'
    global static String upperCase(final String str) {
*/
    }


    @isTest(SeeAllData=false)
    static void valueOf() {
//            global static String valueOf(final Integer[] value) {
    }
    
    @isTest(SeeAllData=false)
    static void wrap2args() {
/*            StringUtils.wrap(null, *)        = null
     * StringUtils.wrap('', *)          = ''
     * StringUtils.wrap('ab', '\0')     = 'ab'
     * StringUtils.wrap('ab', 'x')      = 'xabx'
     * StringUtils.wrap('ab', '\'')     = ''ab''
     * StringUtils.wrap('\'ab\'', '\'') = '\'\'ab\'\''
    global static String wrap(final String str, final Integer wrapWith) {
*/
    }

    @isTest(SeeAllData=false)
    static void wrap2args2() {
/*        StringUtils.wrap(null, *)         = null
     * StringUtils.wrap('', *)           = ''
     * StringUtils.wrap('ab', null)      = 'ab'
     * StringUtils.wrap('ab', 'x')       = 'xabx'
     * StringUtils.wrap('ab', '\'')      = '\'ab\''
     * StringUtils.wrap('\'ab\'', '\'')  = '\'\'ab\'\''
     * StringUtils.wrap('ab', ''')       = ''ab''
     * StringUtils.wrap(''abcd'', ''')   = '''abcd'''
     * StringUtils.wrap('\'abcd\'', ''') = ''\'abcd\'''
     * StringUtils.wrap(''abcd'', '\'')  = '\''abcd'\''
    global static String wrap(final String str, final String wrapWith) {
*/
    }
    


        @isTest(SeeAllData=false)
        static void wrapIfMissing2args() {
/*        StringUtils.wrapIfMissing(null, *)        = null
     * StringUtils.wrapIfMissing('', *)          = ''
     * StringUtils.wrapIfMissing('ab', '\0')     = 'ab'
     * StringUtils.wrapIfMissing('ab', 'x')      = 'xabx'
     * StringUtils.wrapIfMissing('ab', '\'')     = ''ab''
     * StringUtils.wrapIfMissing('\'ab\'', '\'') = '\'ab\''
     * StringUtils.wrapIfMissing('/', '/')  = '/'
     * StringUtils.wrapIfMissing('a/b/c', '/')  = '/a/b/c/'
     * StringUtils.wrapIfMissing('/a/b/c', '/')  = '/a/b/c/'
     * StringUtils.wrapIfMissing('a/b/c/', '/')  = '/a/b/c/'
    global static String wrapIfMissing(final String str, final Integer wrapWith) {
*/
    }

    @isTest(SeeAllData=false)
    static void wrapIfMissing() {
/*        StringUtils.wrapIfMissing(null, *)         = null
     * StringUtils.wrapIfMissing('', *)           = ''
     * StringUtils.wrapIfMissing('ab', null)      = 'ab'
     * StringUtils.wrapIfMissing('ab', 'x')       = 'xabx'
     * StringUtils.wrapIfMissing('ab', '\'')      = '\'ab\''
     * StringUtils.wrapIfMissing('\'ab\'', '\'')  = '\'ab\''
     * StringUtils.wrapIfMissing('ab', ''')       = ''ab''
     * StringUtils.wrapIfMissing(''abcd'', ''')   = ''abcd''
     * StringUtils.wrapIfMissing('\'abcd\'', ''') = ''\'abcd\'''
     * StringUtils.wrapIfMissing(''abcd'', '\'')  = '\''abcd'\''
     * StringUtils.wrapIfMissing('/', '/')  = '/'
     * StringUtils.wrapIfMissing('a/b/c', '/')  = '/a/b/c/'
     * StringUtils.wrapIfMissing('/a/b/c', '/')  = '/a/b/c/'
*/
        System.assertEquals('/a/b/c/', StringUtils.wrapIfMissing('a/b/c/', '/'));
    }
}
