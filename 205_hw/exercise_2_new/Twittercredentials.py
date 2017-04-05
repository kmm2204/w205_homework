import tweepy

consumer_key = "cGThjRuTfkIE7JQY0sCcvfB3I";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "iGDt0z3pxi6fpUjBk4Kj7p4tqY8LDPifDLeznG6JYzdb6RQu12";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "16870392-fjVKF27GBQWMYiCDGGmBCYtQbIBpxFgFDvugZEshV";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "8GZgiJC30TTDMvq8fNSbkmfyoAAxtpDnYpZv4A06Nu0Yw";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



