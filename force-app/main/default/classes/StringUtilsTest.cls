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
    
    * StringUtils.abbreviate(null, null, *, *)                 = null
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
    * StringUtils.abbreviate('abcdefghij', 'abra', 0, 4)       = IllegalArgumentException
    * StringUtils.abbreviate('abcdefghij', '...', 5, 6)        = IllegalArgumentException
    * </pre>
    *
    * @param str  the String to check, may be null
    * @param abbrevMarker  the String used as replacement marker
    * @param offset  left edge of source String
    * @param maxWidth  maximum length of result String, must be at least 4
    * @return abbreviated String, {@code null} if null String input
    * @throws IllegalArgumentException if the width is too small
    * @since 3.6
    */
   global static String abbreviate(final String str, final String abbrevMarker, Integer offset, final Integer maxWidth) {



    * <p>This abbreviation only occurs if the following criteria is met:</p>
    * <ul>
    * <li>Neither the String for abbreviation nor the replacement String are null or empty </li>
    * <li>The length to truncate to is less than the length of the supplied String</li>
    * <li>The length to truncate to is greater than 0</li>
    * <li>The abbreviated String will have enough room for the length supplied replacement String
    * and the first and last characters of the supplied String for abbreviation</li>
    * </ul>
    * <p>Otherwise, the returned String will be the same as the supplied String for abbreviation.
    * </p>
    *
    * <pre>
    * StringUtils.abbreviateMiddle(null, null, 0)      = null
    * StringUtils.abbreviateMiddle('abc', null, 0)      = 'abc'
    * StringUtils.abbreviateMiddle('abc', '.', 0)      = 'abc'
    * StringUtils.abbreviateMiddle('abc', '.', 3)      = 'abc'
    * StringUtils.abbreviateMiddle('abcdef', '.', 4)     = 'ab.f'
    * </pre>
    *
    * @param str  the String to abbreviate, may be null
    * @param middle the String to replace the middle characters with, may be null
    * @param length the length to abbreviate {@code str} to.
    * @return the abbreviated String if the above criteria is met, or the original String supplied for abbreviation.
    * @since 2.5
    */
   global static String abbreviateMiddle(final String str, final String middle, final Integer length) {
    


    * StringUtils.center(null, *)   = null
    * StringUtils.center('', 4)     = '    '
    * StringUtils.center('ab', -1)  = 'ab'
    * StringUtils.center('ab', 4)   = ' ab '
    * StringUtils.center('abcd', 2) = 'abcd'
    * StringUtils.center('a', 4)    = ' a  '
    * </pre>
    *
    * @param str  the String to center, may be null
    * @param size  the Integer size of new String, negative treated as zero
    * @return centered String, {@code null} if null String input
    */
   global static String center(final String str, final Integer size) {


    * StringUtils.center(null, *, *)     = null
    * StringUtils.center('', 4, ' ')     = '    '
    * StringUtils.center('ab', -1, ' ')  = 'ab'
    * StringUtils.center('ab', 4, ' ')   = ' ab '
    * StringUtils.center('abcd', 2, ' ') = 'abcd'
    * StringUtils.center('a', 4, ' ')    = ' a  '
    * StringUtils.center('a', 4, 'y')    = 'yayy'
    * </pre>
    *
    * @param str  the String to center, may be null
    * @param size  the Integer size of new String, negative treated as zero
    * @param padChar  the character to pad the new String with
    * @return centered String, {@code null} if null String input
    * @since 2.0
    */
   global static String center(String str, final Integer size, final Integer padChar) {



    * StringUtils.center(null, *, *)     = null
    * StringUtils.center('', 4, ' ')     = '    '
    * StringUtils.center('ab', -1, ' ')  = 'ab'
    * StringUtils.center('ab', 4, ' ')   = ' ab '
    * StringUtils.center('abcd', 2, ' ') = 'abcd'
    * StringUtils.center('a', 4, ' ')    = ' a  '
    * StringUtils.center('a', 4, 'yz')   = 'yayz'
    * StringUtils.center('abc', 7, null) = '  abc  '
    * StringUtils.center('abc', 7, '')   = '  abc  '
    * </pre>
    *
    * @param str  the String to center, may be null
    * @param size  the Integer size of new String, negative treated as zero
    * @param padStr  the String to pad the new String with, must not be null or empty
    * @return centered String, {@code null} if null String input
    * @throws IllegalArgumentException if padStr is {@code null} or empty
    */
   global static String center(String str, final Integer size, String padStr) {


    * StringUtils.chomp(null)          = null
    * StringUtils.chomp('')            = ''
    * StringUtils.chomp('abc \r')      = 'abc '
    * StringUtils.chomp('abc\n')       = 'abc'
    * StringUtils.chomp('abc\r\n')     = 'abc'
    * StringUtils.chomp('abc\r\n\r\n') = 'abc\r\n'
    * StringUtils.chomp('abc\n\r')     = 'abc\n'
    * StringUtils.chomp('abc\n\rabc')  = 'abc\n\rabc'
    * StringUtils.chomp('\r')          = ''
    * StringUtils.chomp('\n')          = ''
    * StringUtils.chomp('\r\n')        = ''
    * </pre>
    *
    * @param str  the String to chomp a newline from, may be null
    * @return String without newline, {@code null} if null String input
    */
   global static String chomp(final String str) {



    * StringUtils.compare(null, null)   = 0
    * StringUtils.compare(null , 'a')   &lt; 0
    * StringUtils.compare('a', null)    &gt; 0
    * StringUtils.compare('abc', 'abc') = 0
    * StringUtils.compare('a', 'b')     &lt; 0
    * StringUtils.compare('b', 'a')     &gt; 0
    * StringUtils.compare('a', 'B')     &gt; 0
    * StringUtils.compare('ab', 'abc')  &lt; 0
    * </pre>
    *
    * @see #compare(String, String, Boolean)
    * @see String#compareTo(String)
    * @param str1  the String to compare from
    * @param str2  the String to compare to
    * @return &lt; 0, 0, &gt; 0, if {@code str1} is respectively less, equal or greater than {@code str2}
    * @since 3.5
    */
   global static Integer compare(final String str1, final String str2) {




    * StringUtils.compare(null, null, *)     = 0
    * StringUtils.compare(null , 'a', true)  &lt; 0
    * StringUtils.compare(null , 'a', false) &gt; 0
    * StringUtils.compare('a', null, true)   &gt; 0
    * StringUtils.compare('a', null, false)  &lt; 0
    * StringUtils.compare('abc', 'abc', *)   = 0
    * StringUtils.compare('a', 'b', *)       &lt; 0
    * StringUtils.compare('b', 'a', *)       &gt; 0
    * StringUtils.compare('a', 'B', *)       &gt; 0
    * StringUtils.compare('ab', 'abc', *)    &lt; 0
    * </pre>
    *
    * @see String#compareTo(String)
    * @param str1  the String to compare from
    * @param str2  the String to compare to
    * @param nullIsLess  whether consider {@code null} value less than non-{@code null} value
    * @return &lt; 0, 0, &gt; 0, if {@code str1} is respectively less, equal ou greater than {@code str2}
    * @since 3.5
    */
   global static Integer compare(final String str1, final String str2, final Boolean nullIsLess) {
     



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
    * </pre>
    *
    * @see #compareIgnoreCase(String, String, Boolean)
    * @see String#compareToIgnoreCase(String)
    * @param str1  the String to compare from
    * @param str2  the String to compare to
    * @return &lt; 0, 0, &gt; 0, if {@code str1} is respectively less, equal ou greater than {@code str2},
    *          ignoring case differences.
    * @since 3.5
    */
   global static Integer compareIgnoreCase(final String str1, final String str2) {


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
    * </pre>
    *
    * @see String#compareToIgnoreCase(String)
    * @param str1  the String to compare from
    * @param str2  the String to compare to
    * @param nullIsLess  whether consider {@code null} value less than non-{@code null} value
    * @return &lt; 0, 0, &gt; 0, if {@code str1} is respectively less, equal ou greater than {@code str2},
    *          ignoring case differences.
    * @since 3.5
    */
   global static Integer compareIgnoreCase(final String str1, final String str2, final Boolean nullIsLess) {
    



    * StringUtils.contains(null, *)    = false
    * StringUtils.contains('', *)      = false
    * StringUtils.contains('abc', 'a') = true
    * StringUtils.contains('abc', 'z') = false
    * </pre>
    *
    * @param seq  the CharSequence to check, may be null
    * @param searchChar  the character to find
    * @return true if the CharSequence contains the search character,
    *  false if not or {@code null} string input
    * @since 2.0
    * @since 3.0 Changed signature from contains(String, int) to contains(CharSequence, int)
    */
   global static Boolean contains(final String seq, final Integer searchChar) {





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





    * StringUtils.endsWith(null, null)      = true
    * StringUtils.endsWith(null, 'def')     = false
    * StringUtils.endsWith('abcdef', null)  = false
    * StringUtils.endsWith('abcdef', 'def') = true
    * StringUtils.endsWith('ABCDEF', 'def') = false
    * StringUtils.endsWith('ABCDEF', 'cde') = false
    * StringUtils.endsWith('ABCDEF', '')    = true
    * </pre>
    *
    * @see java.lang.String#endsWith(String)
    * @param str  the CharSequence to check, may be null
    * @param suffix the suffix to find, may be null
    * @return {@code true} if the CharSequence ends with the suffix, case sensitive, or
    *  both {@code null}
    * @since 2.4
    * @since 3.0 Changed signature from endsWith(String, String) to endsWith(CharSequence, CharSequence)
    */
   global static Boolean endsWith(final String str, final String suffix) {



    private static Boolean endsWith(final String str, final String suffix, final Boolean ignoreCase) {



        * StringUtils.equals(null, null)   = true
        * StringUtils.equals(null, 'abc')  = false
        * StringUtils.equals('abc', null)  = false
        * StringUtils.equals('abc', 'abc') = true
        * StringUtils.equals('abc', 'ABC') = false
        * </pre>
        *
        * @param cs1  the first CharSequence, may be {@code null}
        * @param cs2  the second CharSequence, may be {@code null}
        * @return {@code true} if the CharSequences are equal (case-sensitive), or both {@code null}
        * @since 3.0 Changed signature from equals(String, String) to equals(CharSequence, CharSequence)
        * @see Object#equals(Object)
        * @see #equalsIgnoreCase(CharSequence, CharSequence)
        */
       global static Boolean equals(final String cs1, final String cs2) {
           if (cs1 == cs2) {




     * StringUtils.equalsIgnoreCase(null, null)   = true
     * StringUtils.equalsIgnoreCase(null, 'abc')  = false
     * StringUtils.equalsIgnoreCase('abc', null)  = false
     * StringUtils.equalsIgnoreCase('abc', 'abc') = true
     * StringUtils.equalsIgnoreCase('abc', 'ABC') = true
     * </pre>
     *
     * @param cs1  the first CharSequence, may be {@code null}
     * @param cs2  the second CharSequence, may be {@code null}
     * @return {@code true} if the CharSequences are equal (case-insensitive), or both {@code null}
     * @since 3.0 Changed signature from equalsIgnoreCase(String, String) to equalsIgnoreCase(CharSequence, CharSequence)
     * @see #equals(CharSequence, CharSequence)
     */
    global static Boolean equalsIgnoreCase(final String cs1, final String cs2) {




     * StringUtils.getDigits(null)  = null
     * StringUtils.getDigits('')    = ''
     * StringUtils.getDigits('abc') = ''
     * StringUtils.getDigits('1000$') = '1000'
     * StringUtils.getDigits('1123~45') = '112345'
     * StringUtils.getDigits('(541) 754-3010') = '5417543010'
     * StringUtils.getDigits('\u0967\u0968\u0969') = '\u0967\u0968\u0969'
     * </pre>
     *
     * @param str the String to extract digits from, may be null
     * @return String with only digits,
     *           or an empty ('') String if no digits found,
     *           or {@code null} String if {@code str} is null
     * @since 3.6
     */
    global static String getDigits(final String str) {




     * StringUtils.indexOf(null, *)          = -1
     * StringUtils.indexOf(*, null)          = -1
     * StringUtils.indexOf('', '')           = 0
     * StringUtils.indexOf('', *)            = -1 (except when * = '')
     * StringUtils.indexOf('aabaabaa', 'a')  = 0
     * StringUtils.indexOf('aabaabaa', 'b')  = 2
     * StringUtils.indexOf('aabaabaa', 'ab') = 1
     * StringUtils.indexOf('aabaabaa', '')   = 0
     * </pre>
     *
     * @param seq  the CharSequence to check, may be null
     * @param searchSeq  the CharSequence to find, may be null
     * @return the first index of the search CharSequence,
     *  -1 if no match or {@code null} string input
     * @since 2.0
     * @since 3.0 Changed signature from indexOf(String, String) to indexOf(CharSequence, CharSequence)
     */
    global static Integer indexOf(final String seq, final String searchSeq) {



     * StringUtils.indexOf(null, *)         = -1
     * StringUtils.indexOf('', *)           = -1
     * StringUtils.indexOf('aabaabaa', 'a') = 0
     * StringUtils.indexOf('aabaabaa', 'b') = 2
     * </pre>
     *
     * @param seq  the CharSequence to check, may be null
     * @param searchChar  the character to find
     * @return the first index of the search character,
     *  -1 if no match or {@code null} string input
     * @since 2.0
     * @since 3.0 Changed signature from indexOf(String, int) to indexOf(CharSequence, int)
     * @since 3.6 Updated {@link CharSequenceUtils} call to behave more like {@code String}
     */
    global static Integer indexOf(final String seq, final Integer searchChar) {





     * StringUtils.isAllLowerCase(null)   = false
     * StringUtils.isAllLowerCase('')     = false
     * StringUtils.isAllLowerCase('  ')   = false
     * StringUtils.isAllLowerCase('abc')  = true
     * StringUtils.isAllLowerCase('abC')  = false
     * StringUtils.isAllLowerCase('ab c') = false
     * StringUtils.isAllLowerCase('ab1c') = false
     * StringUtils.isAllLowerCase('ab/c') = false
     * </pre>
     *
     * @param cs  the CharSequence to check, may be null
     * @return {@code true} if only contains lowercase characters, and is non-null
     * @since 2.5
     * @since 3.0 Changed signature from isAllLowerCase(String) to isAllLowerCase(CharSequence)
     */
    global static Boolean isAllLowerCase(final String cs) {



     * StringUtils.isAllUpperCase(null)   = false
     * StringUtils.isAllUpperCase('')     = false
     * StringUtils.isAllUpperCase('  ')   = false
     * StringUtils.isAllUpperCase('ABC')  = true
     * StringUtils.isAllUpperCase('aBC')  = false
     * StringUtils.isAllUpperCase('A C')  = false
     * StringUtils.isAllUpperCase('A1C')  = false
     * StringUtils.isAllUpperCase('A/C')  = false
     * </pre>
     *
     * @param cs the CharSequence to check, may be null
     * @return {@code true} if only contains uppercase characters, and is non-null
     * @since 2.5
     * @since 3.0 Changed signature from isAllUpperCase(String) to isAllUpperCase(CharSequence)
     */
    global static Boolean isAllUpperCase(final String cs) {



     * StringUtils.isAlpha(null)   = false
     * StringUtils.isAlpha('')     = false
     * StringUtils.isAlpha('  ')   = false
     * StringUtils.isAlpha('abc')  = true
     * StringUtils.isAlpha('ab2c') = false
     * StringUtils.isAlpha('ab-c') = false
     * </pre>
     *
     * @param cs  the CharSequence to check, may be null
     * @return {@code true} if only contains letters, and is non-null
     * @since 3.0 Changed signature from isAlpha(String) to isAlpha(CharSequence)
     * @since 3.0 Changed '' to return false and not true
     */
    global static Boolean isAlpha(final String cs) {



     * StringUtils.isAlphanumeric(null)   = false
     * StringUtils.isAlphanumeric('')     = false
     * StringUtils.isAlphanumeric('  ')   = false
     * StringUtils.isAlphanumeric('abc')  = true
     * StringUtils.isAlphanumeric('ab c') = false
     * StringUtils.isAlphanumeric('ab2c') = true
     * StringUtils.isAlphanumeric('ab-c') = false
     * </pre>
     *
     * @param cs  the CharSequence to check, may be null
     * @return {@code true} if only contains letters or digits,
     *  and is non-null
     * @since 3.0 Changed signature from isAlphanumeric(String) to isAlphanumeric(CharSequence)
     * @since 3.0 Changed '' to return false and not true
     */
    global static Boolean isAlphanumeric(final String cs) {



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



     * StringUtils.isAnyEmpty((String) null)    = true
     * StringUtils.isAnyEmpty((String[]) null)  = false
     * StringUtils.isAnyEmpty(null, 'foo')      = true
     * StringUtils.isAnyEmpty('', 'bar')        = true
     * StringUtils.isAnyEmpty('bob', '')        = true
     * StringUtils.isAnyEmpty('  bob  ', null)  = true
     * StringUtils.isAnyEmpty(' ', 'bar')       = false
     * StringUtils.isAnyEmpty('foo', 'bar')     = false
     * StringUtils.isAnyEmpty(new String[]{})   = false
     * StringUtils.isAnyEmpty(new String[]{''}) = true
     * </pre>
     *
     * @param css  the CharSequences to check, may be null or empty
     * @return {@code true} if any of the CharSequences are empty or null
     * @since 3.2
     */
    global static Boolean isAnyEmpty(final String cs1, String cs2) {




     * StringUtils.isAsciiPrintable(null)     = false
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
     * </pre>
     *
     * @param cs the CharSequence to check, may be null
     * @return {@code true} if every character is in the range
     *  32 thru 126
     * @since 2.1
     * @since 3.0 Changed signature from isAsciiPrintable(String) to isAsciiPrintable(CharSequence)
     */
    global static Boolean isAsciiPrintable(final String cs) {

    @isTest(SeeAllData=false)
    static void isBlankTest01() {
        System.assertEquals(true, StringUtils.isBlank(null));
        System.assertEquals(true, StringUtils.isBlank(''));
        System.assertEquals(true, StringUtils.isBlank(' '));
        System.assertEquals(false, StringUtils.isBlank('bob'));
        System.assertEquals(false, StringUtils.isBlank('  bob  '));
    }


    * StringUtils.isEmpty(null)      = true
    * StringUtils.isEmpty('')        = true
    * StringUtils.isEmpty(' ')       = false
    * StringUtils.isEmpty('bob')     = false
    * StringUtils.isEmpty('  bob  ') = false
    * </pre>
    *
    * <p>NOTE: This method changed in Lang version 2.0.
    * It no longer trims the CharSequence.
    * That functionality is available in isBlank().</p>
    *
    * @param cs  the CharSequence to check, may be null
    * @return {@code true} if the CharSequence is empty or null
    * @since 3.0 Changed signature from isEmpty(String) to isEmpty(CharSequence)
    */
   global static Boolean isEmpty(final String cs) {



    * StringUtils.isMixedCase(null)    = false
    * StringUtils.isMixedCase('')      = false
    * StringUtils.isMixedCase('ABC')   = false
    * StringUtils.isMixedCase('abc')   = false
    * StringUtils.isMixedCase('aBc')   = true
    * StringUtils.isMixedCase('A c')   = true
    * StringUtils.isMixedCase('A1c')   = true
    * StringUtils.isMixedCase('a/C')   = true
    * StringUtils.isMixedCase('aC\t')  = true
    * </pre>
    *
    * @param cs the CharSequence to check, may be null
    * @return {@code true} if the CharSequence contains both uppercase and lowercase characters
    * @since 3.5
    */
   global static Boolean isMixedCase(final String cs) {






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


    * StringUtils.isNotBlank(null)      = false
    * StringUtils.isNotBlank('')        = false
    * StringUtils.isNotBlank(' ')       = false
    * StringUtils.isNotBlank('bob')     = true
    * StringUtils.isNotBlank('  bob  ') = true
    * </pre>
    *
    * @param cs  the CharSequence to check, may be null
    * @return {@code true} if the CharSequence is
    *  not empty and not null and not whitespace only
    * @since 2.0
    * @since 3.0 Changed signature from isNotBlank(String) to isNotBlank(CharSequence)
    */
   global static Boolean isNotBlank(final String cs) {



    * StringUtils.isNotEmpty(null)      = false
    * StringUtils.isNotEmpty('')        = false
    * StringUtils.isNotEmpty(' ')       = true
    * StringUtils.isNotEmpty('bob')     = true
    * StringUtils.isNotEmpty('  bob  ') = true
    * </pre>
    *
    * @param cs  the CharSequence to check, may be null
    * @return {@code true} if the CharSequence is not empty and not null
    * @since 3.0 Changed signature from isNotEmpty(String) to isNotEmpty(CharSequence)
    */
   global static Boolean isNotEmpty(final String cs) {


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
     * </pre>
     *
     * @param cs  the CharSequence to check, may be null
     * @return {@code true} if only contains digits, and is non-null
     * @since 3.0 Changed signature from isNumeric(String) to isNumeric(CharSequence)
     * @since 3.0 Changed '' to return false and not true
     */
    global static Boolean isNumeric(final String cs) {


        StringUtils.isWhitespace(null)   = false
     * StringUtils.isWhitespace('')     = true
     * StringUtils.isWhitespace('  ')   = true
     * StringUtils.isWhitespace('abc')  = false
     * StringUtils.isWhitespace('ab2c') = false
     * StringUtils.isWhitespace('ab-c') = false
     * </pre>
     *
     * @param cs  the CharSequence to check, may be null
     * @return {@code true} if only contains whitespace, and is non-null
     * @since 2.0
     * @since 3.0 Changed signature from isWhitespace(String) to isWhitespace(CharSequence)
     */
    global static Boolean isWhitespace(final String cs) {


        StringUtils.lastIndexOf(null, *)          = -1
     * StringUtils.lastIndexOf(*, null)          = -1
     * StringUtils.lastIndexOf('', '')           = 0
     * StringUtils.lastIndexOf('aabaabaa', 'a')  = 7
     * StringUtils.lastIndexOf('aabaabaa', 'b')  = 5
     * StringUtils.lastIndexOf('aabaabaa', 'ab') = 4
     * StringUtils.lastIndexOf('aabaabaa', '')   = 8
     * </pre>
     *
     * @param seq  the CharSequence to check, may be null
     * @param searchSeq  the CharSequence to find, may be null
     * @return the last index of the search String,
     *  -1 if no match or {@code null} string input
     * @since 2.0
     * @since 3.0 Changed signature from lastIndexOf(String, String) to lastIndexOf(CharSequence, CharSequence)
     */
    global static Integer lastIndexOf(final String seq, final String searchSeq) {




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
     * </pre>
     *
     * @param seq  the CharSequence to check, may be null
     * @param searchSeq  the CharSequence to find, may be null
     * @param startPos  the start position, negative treated as zero
     * @return the last index of the search CharSequence (always &le; startPos),
     *  -1 if no match or {@code null} string input
     * @since 2.0
     * @since 3.0 Changed signature from lastIndexOf(String, String, int) to lastIndexOf(CharSequence, CharSequence, int)
     */
    global static Integer lastIndexOf(final String seq, final String searchSeq, final Integer startPos) {
      


        StringUtils.lastIndexOf(null, *)         = -1
     * StringUtils.lastIndexOf('', *)           = -1
     * StringUtils.lastIndexOf('aabaabaa', 'a') = 7
     * StringUtils.lastIndexOf('aabaabaa', 'b') = 5
     * </pre>
     *
     * @param seq  the {@code CharSequence} to check, may be null
     * @param searchChar  the character to find
     * @return the last index of the search character,
     *  -1 if no match or {@code null} string input
     * @since 2.0
     * @since 3.0 Changed signature from lastIndexOf(String, int) to lastIndexOf(CharSequence, int)
     * @since 3.6 Updated {@link CharSequenceUtils} call to behave more like {@code String}
     */
    global static Integer lastIndexOf(final String seq, final Integer searchChar) {


        StringUtils.left(null, *)    = null
     * StringUtils.left(*, -ve)     = ''
     * StringUtils.left('', *)      = ''
     * StringUtils.left('abc', 0)   = ''
     * StringUtils.left('abc', 2)   = 'ab'
     * StringUtils.left('abc', 4)   = 'abc'
     * </pre>
     *
     * @param str  the String to get the leftmost characters from, may be null
     * @param len  the length of the required String
     * @return the leftmost characters, {@code null} if null String input
     */
    global static String left(final String str, final Integer len) {



     * StringUtils.leftPad(null, *)   = null
     * StringUtils.leftPad('', 3)     = '   '
     * StringUtils.leftPad('bat', 3)  = 'bat'
     * StringUtils.leftPad('bat', 5)  = '  bat'
     * StringUtils.leftPad('bat', 1)  = 'bat'
     * StringUtils.leftPad('bat', -1) = 'bat'
     * </pre>
     *
     * @param str  the String to pad out, may be null
     * @param size  the size to pad to
     * @return left padded String or original String if no padding is necessary,
     *  {@code null} if null String input
     */
    global static String leftPad(final String str, final Integer size) {


        StringUtils.leftPad(null, *, *)     = null
     * StringUtils.leftPad('', 3, 'z')     = 'zzz'
     * StringUtils.leftPad('bat', 3, 'z')  = 'bat'
     * StringUtils.leftPad('bat', 5, 'z')  = 'zzbat'
     * StringUtils.leftPad('bat', 1, 'z')  = 'bat'
     * StringUtils.leftPad('bat', -1, 'z') = 'bat'
     * </pre>
     *
     * @param str  the String to pad out, may be null
     * @param size  the size to pad to
     * @param padChar  the character to pad with
     * @return left padded String or original String if no padding is necessary,
     *  {@code null} if null String input
     * @since 2.0
     */
    global static String leftPad(final String str, final Integer size, final Integer/*char*/ padChar) {
      


        StringUtils.leftPad(null, *, *)      = null
     * StringUtils.leftPad('', 3, 'z')      = 'zzz'
     * StringUtils.leftPad('bat', 3, 'yz')  = 'bat'
     * StringUtils.leftPad('bat', 5, 'yz')  = 'yzbat'
     * StringUtils.leftPad('bat', 8, 'yz')  = 'yzyzybat'
     * StringUtils.leftPad('bat', 1, 'yz')  = 'bat'
     * StringUtils.leftPad('bat', -1, 'yz') = 'bat'
     * StringUtils.leftPad('bat', 5, null)  = '  bat'
     * StringUtils.leftPad('bat', 5, '')    = '  bat'
     * </pre>
     *
     * @param str  the String to pad out, may be null
     * @param size  the size to pad to
     * @param padStr  the String to pad with, null or empty treated as single space
     * @return left padded String or original String if no padding is necessary,
     *  {@code null} if null String input
     */
    global static String leftPad(final String str, final Integer size, String padStr) {



        global static Integer length(final String cs) {







     * StringUtils.lowerCase(null)  = null
     * StringUtils.lowerCase('')    = ''
     * StringUtils.lowerCase('aBc') = 'abc'
     * </pre>
     *
     * <p><strong>Note:</strong> As described in the documentation for {@link String#toLowerCase()},
     * the result of this method is affected by the current locale.
     * For platform-independent case transformations, the method {@link #lowerCase(String, Locale)}
     * should be used with a specific locale (e.g. {@link Locale#ENGLISH}).</p>
     *
     * @param str  the String to lower case, may be null
     * @return the lower cased String, {@code null} if null String input
     */
    global static String lowerCase(final String str) {




     * StringUtils.mid(null, *, *)    = null
     * StringUtils.mid(*, *, -ve)     = ''
     * StringUtils.mid('', 0, *)      = ''
     * StringUtils.mid('abc', 0, 2)   = 'ab'
     * StringUtils.mid('abc', 0, 4)   = 'abc'
     * StringUtils.mid('abc', 2, 4)   = 'c'
     * StringUtils.mid('abc', 4, 2)   = ''
     * StringUtils.mid('abc', -2, 2)  = 'ab'
     * </pre>
     *
     * @param str  the String to get the characters from, may be null
     * @param pos  the position to start from, negative treated as zero
     * @param len  the length of the required String
     * @return the middle characters, {@code null} if null String input
     */
    global static String mid(final String str, Integer pos, final Integer len) {




     * StringUtils.repeat(null, 2) = null
     * StringUtils.repeat('', 0)   = ''
     * StringUtils.repeat('', 2)   = ''
     * StringUtils.repeat('a', 3)  = 'aaa'
     * StringUtils.repeat('ab', 2) = 'abab'
     * StringUtils.repeat('a', -2) = ''
     * </pre>
     *
     * @param str  the String to repeat, may be null
     * @param repeat  number of times to repeat str, negative treated as zero
     * @return a new String consisting of the original String repeated,
     *  {@code null} if null String input
     */
    global static String repeat(final String str, final Integer repeat) {
        // Performance tuned for 2.0 (JDK1.4)



        * StringUtils.right(null, *)    = null
        * StringUtils.right(*, -ve)     = ''
        * StringUtils.right('', *)      = ''
        * StringUtils.right('abc', 0)   = ''
        * StringUtils.right('abc', 2)   = 'bc'
        * StringUtils.right('abc', 4)   = 'abc'
        * </pre>
        *
        * @param str  the String to get the rightmost characters from, may be null
        * @param len  the length of the required String
        * @return the rightmost characters, {@code null} if null String input
        */
       global static String right(final String str, final Integer len) {



     * StringUtils.rightPad(null, *)   = null
     * StringUtils.rightPad('', 3)     = '   '
     * StringUtils.rightPad('bat', 3)  = 'bat'
     * StringUtils.rightPad('bat', 5)  = 'bat  '
     * StringUtils.rightPad('bat', 1)  = 'bat'
     * StringUtils.rightPad('bat', -1) = 'bat'
     * </pre>
     *
     * @param str  the String to pad out, may be null
     * @param size  the size to pad to
     * @return right padded String or original String if no padding is necessary,
     *  {@code null} if null String input
     */
    global static String rightPad(final String str, final Integer size) {


        StringUtils.rightPad(null, *, *)     = null
     * StringUtils.rightPad('', 3, 'z')     = 'zzz'
     * StringUtils.rightPad('bat', 3, 'z')  = 'bat'
     * StringUtils.rightPad('bat', 5, 'z')  = 'batzz'
     * StringUtils.rightPad('bat', 1, 'z')  = 'bat'
     * StringUtils.rightPad('bat', -1, 'z') = 'bat'
     * </pre>
     *
     * @param str  the String to pad out, may be null
     * @param size  the size to pad to
     * @param padChar  the character to pad with
     * @return right padded String or original String if no padding is necessary,
     *  {@code null} if null String input
     * @since 2.0
     */
    global static String rightPad(final String str, final Integer size, final Integer padChar) {
      



     * StringUtils.rightPad(null, *, *)      = null
     * StringUtils.rightPad('', 3, 'z')      = 'zzz'
     * StringUtils.rightPad('bat', 3, 'yz')  = 'bat'
     * StringUtils.rightPad('bat', 5, 'yz')  = 'batyz'
     * StringUtils.rightPad('bat', 8, 'yz')  = 'batyzyzy'
     * StringUtils.rightPad('bat', 1, 'yz')  = 'bat'
     * StringUtils.rightPad('bat', -1, 'yz') = 'bat'
     * StringUtils.rightPad('bat', 5, null)  = 'bat  '
     * StringUtils.rightPad('bat', 5, '')    = 'bat  '
     * </pre>
     *
     * @param str  the String to pad out, may be null
     * @param size  the size to pad to
     * @param padStr  the String to pad with, null or empty treated as single space
     * @return right padded String or original String if no padding is necessary,
     *  {@code null} if null String input
     */
    global static String rightPad(final String str, final Integer size, String padStr) {



        StringUtils.rotate(null, *)        = null
     * StringUtils.rotate('', *)          = ''
     * StringUtils.rotate('abcdefg', 0)   = 'abcdefg'
     * StringUtils.rotate('abcdefg', 2)   = 'fgabcde'
     * StringUtils.rotate('abcdefg', -2)  = 'cdefgab'
     * StringUtils.rotate('abcdefg', 7)   = 'abcdefg'
     * StringUtils.rotate('abcdefg', -7)  = 'abcdefg'
     * StringUtils.rotate('abcdefg', 9)   = 'fgabcde'
     * StringUtils.rotate('abcdefg', -9)  = 'cdefgab'
     * </pre>
     *
     * @param str  the String to rotate, may be null
     * @param shift  number of time to shift (positive : right shift, negative : left shift)
     * @return the rotated String,
     *          or the original String if {@code shift == 0},
     *          or {@code null} if null String input
     * @since 3.5
     */
    global static String rotate(final String str, final Integer shift) {



        StringUtils.startsWith(null, null)      = true
     * StringUtils.startsWith(null, 'abc')     = false
     * StringUtils.startsWith('abcdef', null)  = false
     * StringUtils.startsWith('abcdef', 'abc') = true
     * StringUtils.startsWith('ABCDEF', 'abc') = false
     * </pre>
     *
     * @see java.lang.String#startsWith(String)
     * @param str  the CharSequence to check, may be null
     * @param prefix the prefix to find, may be null
     * @return {@code true} if the CharSequence starts with the prefix, case sensitive, or
     *  both {@code null}
     * @since 2.4
     * @since 3.0 Changed signature from startsWith(String, String) to startsWith(CharSequence, CharSequence)
     */
    global static Boolean startsWith(final String str, final String prefix) {



        private static Boolean startsWith(final String str, final String prefix, final Boolean ignoreCase) {



            StringUtils.substring(null, *)   = null
     * StringUtils.substring('', *)     = ''
     * StringUtils.substring('abc', 0)  = 'abc'
     * StringUtils.substring('abc', 2)  = 'c'
     * StringUtils.substring('abc', 4)  = ''
     * StringUtils.substring('abc', -2) = 'bc'
     * StringUtils.substring('abc', -4) = 'abc'
     * </pre>
     *
     * @param str  the String to get the substring from, may be null
     * @param start  the position to start from, negative means
     *  count back from the end of the String by this many characters
     * @return substring from start position, {@code null} if null String input
     */
    global static String substring(final String str, Integer start) {



        StringUtils.substring(null, *, *)    = null
     * StringUtils.substring('', * ,  *)    = '';
     * StringUtils.substring('abc', 0, 2)   = 'ab'
     * StringUtils.substring('abc', 2, 0)   = ''
     * StringUtils.substring('abc', 2, 4)   = 'c'
     * StringUtils.substring('abc', 4, 6)   = ''
     * StringUtils.substring('abc', 2, 2)   = ''
     * StringUtils.substring('abc', -2, -1) = 'b'
     * StringUtils.substring('abc', -4, 2)  = 'ab'
     * </pre>
     *
     * @param str  the String to get the substring from, may be null
     * @param start  the position to start from, negative means
     *  count back from the end of the String by this many characters
     * @param end1  the position to end at (exclusive), negative means
     *  count back from the end of the String by this many characters
     * @return substring from start position to end position,
     *  {@code null} if null String input
     */
    global static String substring(final String str, Integer start, Integer end1) {



        StringUtils.trim(null)          = null
     * StringUtils.trim('')            = ''
     * StringUtils.trim('     ')       = ''
     * StringUtils.trim('abc')         = 'abc'
     * StringUtils.trim('    abc    ') = 'abc'
     * </pre>
     *
     * @param str  the String to be trimmed, may be null
     * @return the trimmed string, {@code null} if null String input
     */
    global static String trim(final String str) {


        StringUtils.trimToEmpty(null)          = ''
     * StringUtils.trimToEmpty('')            = ''
     * StringUtils.trimToEmpty('     ')       = ''
     * StringUtils.trimToEmpty('abc')         = 'abc'
     * StringUtils.trimToEmpty('    abc    ') = 'abc'
     * </pre>
     *
     * @param str  the String to be trimmed, may be null
     * @return the trimmed String, or an empty String if {@code null} input
     * @since 2.0
     */
    global static String trimToEmpty(final String str) {


        StringUtils.trimToNull(null)          = null
     * StringUtils.trimToNull('')            = null
     * StringUtils.trimToNull('     ')       = null
     * StringUtils.trimToNull('abc')         = 'abc'
     * StringUtils.trimToNull('    abc    ') = 'abc'
     * </pre>
     *
     * @param str  the String to be trimmed, may be null
     * @return the trimmed String,
     *  {@code null} if only chars &lt;= 32, empty or null String input
     * @since 2.0
     */
    global static String trimToNull(final String str) {


        StringUtils.truncate(null, 0)       = null
     * StringUtils.truncate(null, 2)       = null
     * StringUtils.truncate('', 4)         = ''
     * StringUtils.truncate('abcdefg', 4)  = 'abcd'
     * StringUtils.truncate('abcdefg', 6)  = 'abcdef'
     * StringUtils.truncate('abcdefg', 7)  = 'abcdefg'
     * StringUtils.truncate('abcdefg', 8)  = 'abcdefg'
     * StringUtils.truncate('abcdefg', -1) = throws an IllegalArgumentException
     * </pre>
     *
     * @param str  the String to truncate, may be null
     * @param maxWidth  maximum length of result String, must be positive
     * @return truncated String, {@code null} if null String input
     * @throws IllegalArgumentException If {@code maxWidth} is less than {@code 0}
     * @since 3.5
     */
    global static String truncate(final String str, final Integer maxWidth) {


        StringUtils.truncate(null, 0, 0) = null
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
        * </pre>
        *
        * @param str  the String to truncate, may be null
        * @param offset  left edge of source String
        * @param maxWidth  maximum length of result String, must be positive
        * @return truncated String, {@code null} if null String input
        * @throws IllegalArgumentException If {@code offset} or {@code maxWidth} is less than {@code 0}
        * @since 3.5
        */
       global static String truncate(final String str, final Integer offset, final Integer maxWidth) {
    
        

        StringUtils.unwrap(null, null)         = null
     * StringUtils.unwrap(null, '\0')         = null
     * StringUtils.unwrap(null, '1')          = null
     * StringUtils.unwrap('a', 'a')           = 'a'
     * StringUtils.unwrap('aa', 'a')           = ''
     * StringUtils.unwrap('\'abc\'', '\'')    = 'abc'
     * StringUtils.unwrap('AABabcBAA', 'A')   = 'ABabcBA'
     * StringUtils.unwrap('A', '#')           = 'A'
     * StringUtils.unwrap('#A', '#')          = '#A'
     * StringUtils.unwrap('A#', '#')          = 'A#'
     * </pre>
     *
     * @param str
     *          the String to be unwrapped, can be null
     * @param wrapChar
     *          the character used to unwrap
     * @return unwrapped String or the original string
     *          if it is not quoted properly with the wrapChar
     * @since 3.6
     */
    global static String unwrap(final String str, final Integer wrapChar) {


        StringUtils.unwrap(null, null)         = null
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
     * </pre>
     *
     * @param str
     *          the String to be unwrapped, can be null
     * @param wrapToken
     *          the String used to unwrap
     * @return unwrapped String or the original string
     *          if it is not quoted properly with the wrapToken
     * @since 3.6
     */
    global static String unwrap(final String str, final String wrapToken) {


        StringUtils.upperCase(null)  = null
     * StringUtils.upperCase('')    = ''
     * StringUtils.upperCase('aBc') = 'ABC'
     * </pre>
     *
     * <p><strong>Note:</strong> As described in the documentation for {@link String#toUpperCase()},
     * the result of this method is affected by the current locale.
     * For platform-independent case transformations, the method {@link #lowerCase(String, Locale)}
     * should be used with a specific locale (e.g. {@link Locale#ENGLISH}).</p>
     *
     * @param str  the String to upper case, may be null
     * @return the upper cased String, {@code null} if null String input
     */
    global static String upperCase(final String str) {


        global static String valueOf(final Integer[] value) {



            StringUtils.wrap(null, *)        = null
     * StringUtils.wrap('', *)          = ''
     * StringUtils.wrap('ab', '\0')     = 'ab'
     * StringUtils.wrap('ab', 'x')      = 'xabx'
     * StringUtils.wrap('ab', '\'')     = ''ab''
     * StringUtils.wrap('\'ab\'', '\'') = '\'\'ab\'\''
     * </pre>
     *
     * @param str
     *            the string to be wrapped, may be {@code null}
     * @param wrapWith
     *            the char that will wrap {@code str}
     * @return the wrapped string, or {@code null} if {@code str==null}
     * @since 3.4
     */
    global static String wrap(final String str, final Integer wrapWith) {



        StringUtils.wrap(null, *)         = null
     * StringUtils.wrap('', *)           = ''
     * StringUtils.wrap('ab', null)      = 'ab'
     * StringUtils.wrap('ab', 'x')       = 'xabx'
     * StringUtils.wrap('ab', '\'')      = '\'ab\''
     * StringUtils.wrap('\'ab\'', '\'')  = '\'\'ab\'\''
     * StringUtils.wrap('ab', ''')       = ''ab''
     * StringUtils.wrap(''abcd'', ''')   = '''abcd'''
     * StringUtils.wrap('\'abcd\'', ''') = ''\'abcd\'''
     * StringUtils.wrap(''abcd'', '\'')  = '\''abcd'\''
     * </pre>
     *
     * @param str
     *            the String to be wrapper, may be null
     * @param wrapWith
     *            the String that will wrap str
     * @return wrapped String, {@code null} if null String input
     * @since 3.4
     */
    global static String wrap(final String str, final String wrapWith) {


        StringUtils.wrapIfMissing(null, *)        = null
     * StringUtils.wrapIfMissing('', *)          = ''
     * StringUtils.wrapIfMissing('ab', '\0')     = 'ab'
     * StringUtils.wrapIfMissing('ab', 'x')      = 'xabx'
     * StringUtils.wrapIfMissing('ab', '\'')     = ''ab''
     * StringUtils.wrapIfMissing('\'ab\'', '\'') = '\'ab\''
     * StringUtils.wrapIfMissing('/', '/')  = '/'
     * StringUtils.wrapIfMissing('a/b/c', '/')  = '/a/b/c/'
     * StringUtils.wrapIfMissing('/a/b/c', '/')  = '/a/b/c/'
     * StringUtils.wrapIfMissing('a/b/c/', '/')  = '/a/b/c/'
     * </pre>
     *
     * @param str
     *            the string to be wrapped, may be {@code null}
     * @param wrapWith
     *            the char that will wrap {@code str}
     * @return the wrapped string, or {@code null} if {@code str==null}
     * @since 3.5
     */
    global static String wrapIfMissing(final String str, final Integer wrapWith) {



        StringUtils.wrapIfMissing(null, *)         = null
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
     * StringUtils.wrapIfMissing('a/b/c/', '/')  = '/a/b/c/'
     * </pre>
     *
     * @param str
     *            the string to be wrapped, may be {@code null}
     * @param wrapWith
     *            the string that will wrap {@code str}
     * @return the wrapped string, or {@code null} if {@code str==null}
     * @since 3.5
     */
    global static String wrapIfMissing(final String str, final String wrapWith) {


        



}
