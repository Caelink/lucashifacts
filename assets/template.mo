Subject: lucashi fact of the day
Content-Type: multipart/related; boundary="message"

--message
Content-Type: multipart/alternative; boundary="body"

--body
Content-Type: text/html; charset="UTF-8"

<h1>Hello!</h1>
<p>it is i your dude<br>
thank you for subscribing to<br>
lucashi's lit facts</p>

<p>Did <em>you</em> know that
{{RANDOM_FACT_HTML}}
</p>
{{#INCLUDE_IMAGE}}
<img src="cid:lucas">

{{/INCLUDE_IMAGE}}
--body--
{{#INCLUDE_IMAGE}}
--message
Content-Type: image/jpeg; name="lucashi.jpg"
Content-Disposition: inline; filename="lucashi.jpg"
Content-Transfer-Encoding: base64
Content-ID: <lucas>
X-Attachment-Id: lucas

{{> partial}}
{{/INCLUDE_IMAGE}}
--message--
