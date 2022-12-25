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
*/
        System.assertEquals('!ghijklmno', StringUtils.abbreviate('abcdefghijklmno', '!', 12, 10));
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
        System.assertEquals(null, StringUtils.center(null, 5, 5));
    /*
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
        System.assertEquals(null, StringUtils.chomp(null));
/*
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
        System.assertEquals(0, StringUtils.compare(null, null));
    /*
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
        System.assertEquals(0, StringUtils.compare(null, null, true));
    /*
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
        System.assertEquals(0, StringUtils.compareIgnoreCase(null, null));
    /*
    *    = 0
    * StringUtils.compareIgnoreCase(null , 'a')   &lt; 0
    * StringUtils.compareIgnoreCase('a', null)    &gt; 0
    * StringUtils.compareIgnoreCase('abc', 'abc') = 0
    * StringUtils.compareIgnoreCase('abc', 'ABC') = 0
    * StringUtils.compareIgnoreCase('a', 'b')     &lt; 0
    * StringUtils.compareIgnoreCase('b', 'a')     &gt; 0
    * StringUtils.compareIgnoreCase('a', 'B')     &lt; 0
    * StringUtils.compareIgnoreCase('A', 'b')     &lt; 0
    * 
    */
        System.assert(StringUtils.compareIgnoreCase('ab', 'ABC') < 0);
    }

    @isTest(SeeAllData=false)
    static void compareIgnoreCase3args() {
        System.assertEquals(0, StringUtils.compareIgnoreCase(null, null, true));
    /*
    *      = 0
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
    */
        System.assert(StringUtils.compareIgnoreCase('ab', 'abc', true) < 0);
    }
    
    @isTest(SeeAllData=false)
    static void contains() {
        System.assertEquals(false, StringUtils.contains((String) null, 'a'.charAt(0)));
/*
    * StringUtils.contains('', *)      = false
    * StringUtils.contains('abc', 'a') = true
    */
        System.assertEquals(false, StringUtils.contains('abc', 'z'.charAt(0)));
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
        System.assertEquals(true, StringUtils.endsWith(null, null));
    /*
    * StringUtils.endsWith(null, 'def')     = false
    * StringUtils.endsWith('abcdef', null)  = false
    * StringUtils.endsWith('abcdef', 'def') = true
    * StringUtils.endsWith('ABCDEF', 'def') = false
    * StringUtils.endsWith('ABCDEF', 'cde') = false
    */
        System.assertEquals(true, StringUtils.endsWith('ABCDEF', ''));
    }

    @isTest(SeeAllData=false)
    static void equals2args() {
        System.assertEquals(true, StringUtils.equals(null, null));
/*
        * StringUtils.equals(null, 'abc')  = false
        * StringUtils.equals('abc', null)  = false
        * StringUtils.equals('abc', 'abc') = true
*/
        System.assertEquals(false, StringUtils.equals('abc', 'ABC'));
    }
    
    @isTest(SeeAllData=false)
    static void equalsIgnoreCase2args() {
        System.assertEquals(true, StringUtils.equalsIgnoreCase(null, null));
        /*
     * StringUtils.equalsIgnoreCase(null, 'abc')  = false
     * StringUtils.equalsIgnoreCase('abc', null)  = false
     * StringUtils.equalsIgnoreCase('abc', 'abc') = true
        */
        System.assertEquals(true, StringUtils.equalsIgnoreCase('abc', 'ABC'));
    }


    @isTest(SeeAllData=false)
    static void getDigits() {
        System.assertEquals(null, StringUtils.getDigits(null));
/*     * StringUtils.getDigits('')    = ''
     * StringUtils.getDigits('abc') = ''
     * StringUtils.getDigits('1000$') = '1000'
     * StringUtils.getDigits('1123~45') = '112345'
     * StringUtils.getDigits('(541) 754-3010') = '5417543010'
*/
        System.assertEquals('\u0967\u0968\u0969', StringUtils.getDigits('\u0967\u0968\u0969'));
    }

    @isTest(SeeAllData=false)
    static void indexOf2args() {
        System.assertEquals(-1, StringUtils.indexOf(null, 5));
    /*
     * StringUtils.indexOf(*, null)          = -1
     * StringUtils.indexOf('', '')           = 0
     * StringUtils.indexOf('', *)            = -1 (except when * = '')
     * StringUtils.indexOf('aabaabaa', 'a')  = 0
     * StringUtils.indexOf('aabaabaa', 'b')  = 2
     * StringUtils.indexOf('aabaabaa', 'ab') = 1
        */
        System.assertEquals(0, StringUtils.indexOf('aabaabaa', ''));
    }    

    @isTest(SeeAllData=false)
    static void indexOf2args2() {
        System.assertEquals(-1, StringUtils.indexOf('', 99));
/*     * StringUtils.indexOf('aabaabaa', 'a') = 0
        */
        System.assertEquals(2, StringUtils.indexOf('aabaabaa', 'b'));
    }
    
    @isTest(SeeAllData=false)
    static void isAllLowerCase() {
        System.assertEquals(false, StringUtils.isAllLowerCase(null));
/*
     *    = false
     * StringUtils.isAllLowerCase('')     = false
     * StringUtils.isAllLowerCase('  ')   = false
     * StringUtils.isAllLowerCase('abc')  = true
     * StringUtils.isAllLowerCase('abC')  = false
     * StringUtils.isAllLowerCase('ab c') = false
     * StringUtils.isAllLowerCase('ab1c') = false
        */
        System.assertEquals(false, StringUtils.isAllLowerCase('ab/c'));
    }
    
    @isTest(SeeAllData=false)
    static void isAllUpperCase() {
        System.assertEquals(false, StringUtils.isAllUpperCase(null));
/*
     *    = false
     * StringUtils.isAllUpperCase('')     = false
     * StringUtils.isAllUpperCase('  ')   = false
     * StringUtils.isAllUpperCase('ABC')  = true
     * StringUtils.isAllUpperCase('aBC')  = false
     * StringUtils.isAllUpperCase('A C')  = false
     * StringUtils.isAllUpperCase('A1C')  = false
        */
        System.assertEquals(false, StringUtils.isAllUpperCase('A/C'));
    }
    

    @isTest(SeeAllData=false)
    static void isAlpha() {
        System.assertEquals(false, StringUtils.isAlpha(null));
/*     *    = false
     * StringUtils.isAlpha('')     = false
     * StringUtils.isAlpha('  ')   = false
     * StringUtils.isAlpha('abc')  = true
     * StringUtils.isAlpha('ab2c') = false
*/  
        System.assertEquals(false, StringUtils.isAlpha('ab-c'));
    }
    
    @isTest(SeeAllData=false)
    static void isAlphanumeric() {
        System.assertEquals(false, StringUtils.isAlphanumeric(null));
/*   * StringUtils.isAlphanumeric('')     = false
     * StringUtils.isAlphanumeric('  ')   = false
     * StringUtils.isAlphanumeric('abc')  = true
     * StringUtils.isAlphanumeric('ab c') = false
     * StringUtils.isAlphanumeric('ab2c') = true
*/  
        System.assertEquals(false, StringUtils.isAlphanumeric('ab-c'));
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
        System.assertEquals(true, StringUtils.isAnyEmpty((String) null));
/*   
     * StringUtils.isAnyEmpty((String[]) null)  = false
     * StringUtils.isAnyEmpty(null, 'foo')      = true
     * StringUtils.isAnyEmpty('', 'bar')        = true
     * StringUtils.isAnyEmpty('bob', '')        = true
     * StringUtils.isAnyEmpty('  bob  ', null)  = true
     * StringUtils.isAnyEmpty(' ', 'bar')       = false
     *      = false
*/     
        System.assertEquals(false, StringUtils.isAnyEmpty('foo', 'bar'));
    }
 
    @isTest(SeeAllData=false)
    static void isAsciiPrintable() {
        System.assertEquals(false, StringUtils.isAsciiPrintable(null));
/*  * StringUtils.isAsciiPrintable('')       = true
     * StringUtils.isAsciiPrintable(' ')      = true
     * StringUtils.isAsciiPrintable('Ceki')   = true
     * StringUtils.isAsciiPrintable('ab2c')   = true
     * StringUtils.isAsciiPrintable('!ab-c~') = true
     * StringUtils.isAsciiPrintable('\u0020') = true
     * StringUtils.isAsciiPrintable('\u0021') = true
     * StringUtils.isAsciiPrintable('\u007e') = true
     * StringUtils.isAsciiPrintable('\u007f') = false
     *  = false
*/   
        System.assertEquals(false, StringUtils.isAsciiPrintable('Ceki G\u00fclc\u00fc'));
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
        System.assertEquals(true, StringUtils.isEmpty(null));
/*    * StringUtils.isEmpty('')        = true
    * StringUtils.isEmpty(' ')       = false
    * StringUtils.isEmpty('bob')     = false
*/    
        System.assertEquals(false, StringUtils.isEmpty('  bob  '));
    }

    @isTest(SeeAllData=false)
    static void isMixedCase() {
        System.assertEquals(false, StringUtils.isMixedCase(null));
/*
    * StringUtils.isMixedCase('')      = false
    * StringUtils.isMixedCase('ABC')   = false
    * StringUtils.isMixedCase('abc')   = false
    * StringUtils.isMixedCase('aBc')   = true
    * StringUtils.isMixedCase('A c')   = true
    * StringUtils.isMixedCase('A1c')   = true
    * StringUtils.isMixedCase('a/C')   = true
*/    
        System.assertEquals(true, StringUtils.isMixedCase('aC\t'));
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
        System.assertEquals(false, StringUtils.isNotBlank(null));
/*
    * StringUtils.isNotBlank('')        = false
    * StringUtils.isNotBlank(' ')       = false
    * StringUtils.isNotBlank('bob')     = true
*/    
        System.assertEquals(true, StringUtils.isNotBlank('  bob  '));
    }


    @isTest(SeeAllData=false)
    static void isNotEmpty() {
        System.assertEquals(false, StringUtils.isNotEmpty(null));
    /*
    * StringUtils.isNotEmpty('')        = false
    * StringUtils.isNotEmpty(' ')       = true
    * StringUtils.isNotEmpty('bob')     = true
*/    
        System.assertEquals(true, StringUtils.isNotEmpty('  bob  '));
    }

    @isTest(SeeAllData=false)
    static void isNumeric() {
        System.assertEquals(false, StringUtils.isNumeric(null));
/*
     * StringUtils.isNumeric('')     = false
     * StringUtils.isNumeric('  ')   = false
     * StringUtils.isNumeric('123')  = true
     * StringUtils.isNumeric('\u0967\u0968\u0969')  = true
     * StringUtils.isNumeric('12 3') = false
     * StringUtils.isNumeric('ab2c') = false
     * StringUtils.isNumeric('12-3') = false
     * StringUtils.isNumeric('12.3') = false
     * StringUtils.isNumeric('-123') = false
*/    
        System.assertEquals(false, StringUtils.isNumeric('+123'));
    }

    @isTest(SeeAllData=false)
    static void isWhitespace() {
        System.assertEquals(false, StringUtils.isWhitespace((String) null));
/*   * StringUtils.isWhitespace('')     = true
     * StringUtils.isWhitespace('  ')   = true
     * StringUtils.isWhitespace('abc')  = false
     * StringUtils.isWhitespace('ab2c') = false
*/    
        System.assertEquals(false, StringUtils.isWhitespace('ab-c'));
    }
    
    @isTest(SeeAllData=false)
    static void lastIndexOf2args1() {
        System.assertEquals(-1, StringUtils.lastIndexOf(null, 99));
/*  * StringUtils.lastIndexOf(*, null)          = -1
    * StringUtils.lastIndexOf('', '')           = 0
    * StringUtils.lastIndexOf('aabaabaa', 'a')  = 7
    * StringUtils.lastIndexOf('aabaabaa', 'b')  = 5
    * StringUtils.lastIndexOf('aabaabaa', 'ab') = 4*/
        System.assertEquals(8, StringUtils.lastIndexOf('aabaabaa', ''));
    }
    

    @isTest(SeeAllData=false)
    static void lastIndexOf3args() {
        System.assertEquals(-1, StringUtils.lastIndexOf((String) null, '99', 99));
/*
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
    */
        System.assertEquals(2, StringUtils.lastIndexOf('aabaabaa', 'ba', 2));
    }

    @isTest(SeeAllData=false)
    static void lastIndexOf2args2() {
        System.assertEquals(-1, StringUtils.lastIndexOf(null, 99));
/*   * StringUtils.lastIndexOf('', *)           = -1
     * StringUtils.lastIndexOf('aabaabaa', 'a') = 7
     *  = 5
*/
        System.assertEquals(5, StringUtils.lastIndexOf('aabaabaa', 'b'));
    }
    
    @isTest(SeeAllData=false)
    static void left2args() {
        System.assertEquals(null, StringUtils.left(null, 99));
/*            
     * StringUtils.left(*, -ve)     = ''
     * StringUtils.left('', *)      = ''
     * StringUtils.left('abc', 0)   = ''
     * StringUtils.left('abc', 2)   = 'ab'
*/    
        System.assertEquals('abc', StringUtils.left('abc', 4));
    }

    @isTest(SeeAllData=false)
    static void leftPad2args() {
        System.assertEquals(null, StringUtils.leftPad(null, 99));
/*   
     * StringUtils.leftPad('', 3)     = '   '
     * StringUtils.leftPad('bat', 3)  = 'bat'
     * StringUtils.leftPad('bat', 5)  = '  bat'
     * StringUtils.leftPad('bat', 1)  = 'bat'
   */
        System.assertEquals('bat', StringUtils.leftPad('bat', -1));
    }
    
    @isTest(SeeAllData=false)
    static void leftPad() {
        System.assertEquals(null, StringUtils.leftPad((String) null, 99, 99));
/*             = null
     * StringUtils.leftPad('', 3, 'z')     = 'zzz'
     * StringUtils.leftPad('bat', 3, 'z')  = 'bat'
     * StringUtils.leftPad('bat', 5, 'z')  = 'zzbat'
     * StringUtils.leftPad('bat', 1, 'z')  = 'bat'
    */
        System.assertEquals('bat', StringUtils.leftPad('bat', -1, 'z'));
    }
    
    @isTest(SeeAllData=false)
    static void leftPad3args() {
        System.assertEquals(null, StringUtils.leftPad((String) null, 99, '99'));
/*   * StringUtils.leftPad('', 3, 'z')      = 'zzz'
     * StringUtils.leftPad('bat', 3, 'yz')  = 'bat'
     * StringUtils.leftPad('bat', 5, 'yz')  = 'yzbat'
     * StringUtils.leftPad('bat', 8, 'yz')  = 'yzyzybat'
     * StringUtils.leftPad('bat', 1, 'yz')  = 'bat'
     * StringUtils.leftPad('bat', -1, 'yz') = 'bat'
     * StringUtils.leftPad('bat', 5, null)  = '  bat'
*/
        System.assertEquals('  bat', StringUtils.leftPad('bat', 5, ''));   
    }
    
    @isTest(SeeAllData=false)
    static void length1arg() {
        System.assertEquals(3, StringUtils.length('abc'));
    }


    @isTest(SeeAllData=false)
    static void lowerCase() {
        System.assertEquals(null, StringUtils.lowerCase(null));
        /*   
     * StringUtils.lowerCase('')    = ''
*/    
        System.assertEquals('abc', StringUtils.lowerCase('aBc'));
    }

    @isTest(SeeAllData=false)
    static void mid() {
        System.assertEquals(null, StringUtils.mid(null, 99, 99));
/*   * StringUtils.mid(*, *, -ve)     = ''
     * StringUtils.mid('', 0, *)      = ''
     * StringUtils.mid('abc', 0, 2)   = 'ab'
     * StringUtils.mid('abc', 0, 4)   = 'abc'
     * StringUtils.mid('abc', 2, 4)   = 'c'
     * StringUtils.mid('abc', 4, 2)   = ''
*/  
        System.assertEquals('ab', StringUtils.mid('abc', -2, 2));
    }

    @isTest(SeeAllData=false)
    static void repeat2args() {
        System.assertEquals(null, StringUtils.repeat((String) null, 2));
/*  
     * StringUtils.repeat('', 0)   = ''
     * StringUtils.repeat('', 2)   = ''
     * StringUtils.repeat('a', 3)  = 'aaa'
     * StringUtils.repeat('ab', 2) = 'abab'
     *  = 
*/
        System.assertEquals('', StringUtils.repeat('a', -2));
    }    

    @isTest(SeeAllData=false)
    static void right2args() {
        System.assertEquals(null, StringUtils.right(null, 99));
     /*  
        * StringUtils.right(*, -ve)     = ''
        * StringUtils.right('', *)      = ''
        * StringUtils.right('abc', 0)   = ''
        * StringUtils.right('abc', 2)   = 'bc'
*/
        System.assertEquals('abc', StringUtils.right('abc', 4));
    }

    @isTest(SeeAllData=false)
    static void rightPad2args() {
        System.assertEquals(null, StringUtils.rightPad(null, 99));
/*    
     * StringUtils.rightPad('', 3)     = '   '
     * StringUtils.rightPad('bat', 3)  = 'bat'
     * StringUtils.rightPad('bat', 5)  = 'bat  '
     * StringUtils.rightPad('bat', 1)  = 'bat'
*/
        System.assertEquals('bat', StringUtils.rightPad('bat', -1));
    }
    
    @isTest(SeeAllData=false)
    static void rightPad3args() {
        System.assertEquals(null, StringUtils.rightPad((String) null, 99, 'z'));
/*      
     * StringUtils.rightPad('', 3, 'z')     = 'zzz'
     * StringUtils.rightPad('bat', 3, 'z')  = 'bat'
     * StringUtils.rightPad('bat', 5, 'z')  = 'batzz'
     * StringUtils.rightPad('bat', 1, 'z')  = 'bat'
   */  
        System.assertEquals('bat', StringUtils.rightPad('bat', -1, 'z'));
    }

    @isTest(SeeAllData=false)
    static void rightPad3args2() {
        System.assertEquals(null, StringUtils.rightPad(null, 99, '99'));
/*    
     * StringUtils.rightPad('', 3, 'z')      = 'zzz'
     * StringUtils.rightPad('bat', 3, 'yz')  = 'bat'
     * StringUtils.rightPad('bat', 5, 'yz')  = 'batyz'
     * StringUtils.rightPad('bat', 8, 'yz')  = 'batyzyzy'
     * StringUtils.rightPad('bat', 1, 'yz')  = 'bat'
     * StringUtils.rightPad('bat', -1, 'yz') = 'bat'
     * StringUtils.rightPad('bat', 5, null)  = 'bat  '
*/    
        System.assertEquals('bat  ', StringUtils.rightPad('bat', 5, ''));
    }

    @isTest(SeeAllData=false)
    static void rotate2args() {
        System.assertEquals(null, StringUtils.rotate(null, 99));
/*              
     * StringUtils.rotate('', *)          = ''
     * StringUtils.rotate('abcdefg', 0)   = 'abcdefg'
     * StringUtils.rotate('abcdefg', 2)   = 'fgabcde'
     * StringUtils.rotate('abcdefg', -2)  = 'cdefgab'
     * StringUtils.rotate('abcdefg', 7)   = 'abcdefg'
     * StringUtils.rotate('abcdefg', -7)  = 'abcdefg'
     * StringUtils.rotate('abcdefg', 9)   = 'fgabcde'
*/    
        System.assertEquals('cdefgab', StringUtils.rotate('abcdefg', -9));
    }

    @isTest(SeeAllData=false)
    static void startsWith2args() {
        System.assertEquals(true, StringUtils.startsWith(null, null));
/*   
     * StringUtils.startsWith(null, 'abc')     = false
     * StringUtils.startsWith('abcdef', null)  = false
     * StringUtils.startsWith('abcdef', 'abc') = true
*/
        System.assertEquals(false, StringUtils.startsWith('ABCDEF', 'abc'));
    }

    @isTest(SeeAllData=false)
    static void substring2arg() {
        System.assertEquals(null, StringUtils.substring(null, 99));
/*   * StringUtils.substring('', *)     = ''
     * StringUtils.substring('abc', 0)  = 'abc'
     * StringUtils.substring('abc', 2)  = 'c'
     * StringUtils.substring('abc', 4)  = ''
     * StringUtils.substring('abc', -2) = 'bc'
*/  
        System.assertEquals('abc', StringUtils.substring('abc', -4));
    }
        
    @isTest(SeeAllData=false)
    static void substring3args() {
        System.assertEquals(null, StringUtils.substring(null, 99, 99));
/*   * StringUtils.substring('', * ,  *)    = '';
     * StringUtils.substring('abc', 0, 2)   = 'ab'
     * StringUtils.substring('abc', 2, 0)   = ''
     * StringUtils.substring('abc', 2, 4)   = 'c'
     * StringUtils.substring('abc', 4, 6)   = ''
     * StringUtils.substring('abc', 2, 2)   = ''
     * StringUtils.substring('abc', -2, -1) = 'b'
*/    
        System.assertEquals('ab', StringUtils.substring('abc', -4, 2));
    }
    
    @isTest(SeeAllData=false)
    static void trim() {
        System.assertEquals(null, StringUtils.trim(null));
/*            
     * StringUtils.trim('')            = ''
     * StringUtils.trim('     ')       = ''
     * StringUtils.trim('abc')         = 'abc'
*/    
        System.assertEquals('abc', StringUtils.trim('    abc    '));
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
*/
        System.assertEquals('A#', StringUtils.unwrap('A#', '#'));
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
*/
        System.assertEquals('A#', StringUtils.unwrap('A#', '#'));
    }
    
    @isTest(SeeAllData=false)
    static void upperCase() {
/*        StringUtils.upperCase(null)  = null
     * StringUtils.upperCase('')    = ''
*/
        System.assertEquals('ABC', StringUtils.upperCase('aBc'));
    }


    @isTest(SeeAllData=false)
    static void valueOf() {
        // TODO 戻り値チェックが必要
        StringUtils.valueOf(new Integer[]{1,2,3});
    }
    
    @isTest(SeeAllData=false)
    static void wrap2args() {
/*            StringUtils.wrap(null, *)        = null
     * StringUtils.wrap('', *)          = ''
     * StringUtils.wrap('ab', '\0')     = 'ab'
     * StringUtils.wrap('ab', 'x')      = 'xabx'
     * StringUtils.wrap('ab', '\'')     = ''ab''
*/
        System.assertEquals('\'\'ab\'\'', StringUtils.wrap('\'ab\'', '\''));
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
            System.assertEquals(null, StringUtils.wrapIfMissing(null, 999));
            /*
     * StringUtils.wrapIfMissing('', *)          = ''
     * StringUtils.wrapIfMissing('ab', '\0')     = 'ab'
     * StringUtils.wrapIfMissing('ab', 'x')      = 'xabx'
     * StringUtils.wrapIfMissing('ab', '\'')     = ''ab''
     * StringUtils.wrapIfMissing('\'ab\'', '\'') = '\'ab\''
     * StringUtils.wrapIfMissing('/', '/')  = '/'
     * StringUtils.wrapIfMissing('a/b/c', '/')  = '/a/b/c/'
     * StringUtils.wrapIfMissing('/a/b/c', '/')  = '/a/b/c/'
*/
        System.assertEquals('/a/b/c/', StringUtils.wrapIfMissing('a/b/c/', '/'));
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
