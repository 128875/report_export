package org.Hooya.controller;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.DigestUtils;

import java.util.Random;

import static org.junit.Assert.*;

@SpringBootTest
public class AdminControllerTest {
    @Test
    public void testPassword(){
        String randomString = this.getRandomString(4);
        System.out.println(randomString);
        String s = DigestUtils.md5DigestAsHex(("admin" + randomString).getBytes());
        System.out.println(s);
    }

    public String getRandomString(int length)
    {
        String str = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }
}