/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * <p>Operations on Integer primitives and Character objects.</p>
 *
 * <p>This class tries to handle {@code null} input gracefully.
 * An exception will not be thrown for a {@code null} input.
 * Each method documents its behavior in more detail.</p>
 *
 * <p>#ThreadSafe#</p>
 * @since 2.1
 * @author Apex migration by Toshiki Iga.
 */
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
        System.assertEquals('A'.charAt(0), CharUtils.toChar('A', 'X'.charAt(0)));
        System.assertEquals('B'.charAt(0), CharUtils.toChar('BA', 'X'.charAt(0)));
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

    @isTest(SeeAllData=false)
    static void isAsciiPrintable01() {
        System.assertEquals(true, CharUtils.isAsciiPrintable('a'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiPrintable('A'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiPrintable('3'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiPrintable('-'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiPrintable('\n'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiPrintable('愛'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void isAsciiControl01() {
        System.assertEquals(false, CharUtils.isAsciiControl('A'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiControl('3'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiControl('-'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiControl('\n'.charAt(0)));
     }

    @isTest(SeeAllData=false)
    static void isAsciiAlpha01() {
         System.assertEquals(true, CharUtils.isAsciiAlpha('A'.charAt(0)));
         System.assertEquals(false, CharUtils.isAsciiAlpha('3'.charAt(0)));
         System.assertEquals(false, CharUtils.isAsciiAlpha('-'.charAt(0)));
         System.assertEquals(false, CharUtils.isAsciiAlpha('\n'.charAt(0)));
         System.assertEquals(false, CharUtils.isAsciiAlpha('愛'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void isAsciiAlphaUpper01() {
        System.assertEquals(false, CharUtils.isAsciiAlphaUpper('a'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiAlphaUpper('A'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaUpper('3'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaUpper('-'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaUpper('\n'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaUpper('愛'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void isAsciiAlphaLower01() {
        System.assertEquals(true, CharUtils.isAsciiAlphaLower('a'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaLower('A'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaLower('3'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaLower('-'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaLower('\n'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphaLower('愛'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void isAsciiNumeric01() {
        System.assertEquals(false, CharUtils.isAsciiNumeric('a'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiNumeric('A'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiNumeric('3'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiNumeric('-'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiNumeric('\n'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiNumeric('愛'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void isAsciiAlphanumeric01() {
        System.assertEquals(true, CharUtils.isAsciiAlphanumeric('a'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiAlphanumeric('A'.charAt(0)));
        System.assertEquals(true, CharUtils.isAsciiAlphanumeric('3'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphanumeric('-'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphanumeric('\n'.charAt(0)));
        System.assertEquals(false, CharUtils.isAsciiAlphanumeric('愛'.charAt(0)));
    }

    @isTest(SeeAllData=false)
    static void compare01() {
        System.assertEquals(true, CharUtils.compare('a'.charAt(0),'b'.charAt(0)) < 0);
        System.assertEquals(true, CharUtils.compare('a'.charAt(0),'a'.charAt(0)) == 0);
        System.assertEquals(true, CharUtils.compare('b'.charAt(0),'a'.charAt(0)) > 0);
    }
}