function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    url_booking: 'https://restful-booker.herokuapp.com',
  }
  if (env == 'dev') {
    config.url_booking = 'https://restful-booker.herokuapp.com'
  } else if (env == 'qa') {
    config.url_booking = 'https://restful-booker-****QA****.herokuapp.com'
  }

  karate.configure("url", 'https://restful-booker.herokuapp.com')
  karate.configure("logPrettyResponse", true)
  karate.configure("ssl", true)
  karate.configure("connectTimeout", 10000)
  karate.configure("readTimeout", 10000)

  return config;
}