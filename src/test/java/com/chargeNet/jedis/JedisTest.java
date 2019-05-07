package com.chargeNet.jedis;
import redis.clients.jedis.Jedis;
import org.junit.Test;

public class JedisTest {
	
	@Test
	public void testJedis() throws Exception{
		
		String host  = "120.79.67.1";
        int port = 6379;
        Jedis jedis = null;
        try {
            jedis = new Jedis(host,port);
            jedis.auth("123456");
            jedis.select(1);
            jedis.set("name","kun");
            String name = jedis.get("name");
            System.out.println("name = " + name);
            jedis.flushDB();
            String name2 = jedis.get("name");
            System.out.println("name2 = " + name2);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (null != jedis){
                try {
                    jedis.close();
                }catch (Exception e){
                    System.out.println("redis连接关闭失败");
                    e.printStackTrace();
                }
            }
        }

	}
}
