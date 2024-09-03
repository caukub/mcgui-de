# Domain {#domains}
Services (web, game server, ...) on the Internet run on a so-called IP address, which can look like `142.251.36.142`, or `2001:0db8:85a3:0000:0000:8a2e:0370:7334`. But such an address is hard to remember. This is why domains were created.

Such a domain can be, for example, `google.com`. In layman's terms, a domain is an address on the Internet expressed "in human language".

## Basics {#domain-basics}
It is important to note that domains are registered centrally and so are not tied to any service. That means that when you purchase a Minecraft server or web hosting service, it doesn't mean that you will also have any domain at your disposal. A domain is a service that needs to be purchased separately. The moment you own the domain, you can direct the domain to as many services as you need.

It also follows that if no service runs on the domain you want, it does not mean that you can register the domain and use it for your project. There may be no service available on the domain, but it can still be registered, and thus no one else can register and therefore use it, since as mentioned, domains are registered centrally, and even if they are registered, the domain does not have to point to any service. The availability of a domain can be verified using [WHOIS](#whois) (or simply by trying to register the domain).

## Domain registration {#domain-registration}
It happens that one wants to register a subdomain, e.g. `mc.domain.tld` or `play.domain.tld`. However, only the domain itself (the root domain) is registered, i.e. `domain.tld`. Subdomains, such as `mc.domain.tld`, can be set up as many as you need after domain registration using [DNS records](#how-domains-work).

**The domain name and extension cannot be changed in any way after registration**. If you would like a different domain name or extension, you must purchase a new domain.

Domains are paid annually. The minimum registration period is one year. If necessary, the domain can be registered/renewed for more years in advance.

In order to use the domain, the domain must first be registered. Some people think that if their service providers allow them to "configure" the domain in the service administration, the domain will start working, but this is not the case. You have to register the domain first (but even then the domain doesn't magically start working, [domain needs to be pointed to the service](#how-domains-work)).

There are many registrars like PorkBun, NameCheap, Google Domains, or Cloudflare. I personally recommend Cloudflare. [You'll probably want to move your domain to Cloudflare even if it's registered elsewhere](#move-to-cloudflare). At the same time, Cloudflare has zero margins on domains.

However, not every registrar offers the [TLD](~tld) you may want. If you don't want an unusal [TLD](~tld), most registrars will satisfy your needs, but for regional (usualy smaller countries) TLDs you may need local registar.

### What to watch out for {#domain-catches}
Cloudflare has zero margins on domains, but even so, some registrars have prices that are seemingly lower. However, this is usually due to the fact that the first year the price is lower, but subsequent years get significantly more expensive.

There are very cheap [TLDs](~tld), such as *.fun*, *.online*, *.site*, *.space*, *.art* or *.xyz*. Very cheap domains usually come at such a low price only for the first year of registration, with subsequent years becoming significantly more expensive.

There are even free domains, such as *.tk* or *.cf*, which can be registered with the registrar Freenom. These domains can be problematic for other reasons, but if it is a serious project, they are not suitable even on the principle of trustworthiness, as they are often used by scammers. If you are serious about your project, it is advisable to consider buying a domain with a typical ending such as `.com` or `.net` which is more credible and does not carry any hidden hooks.

Once a domain is registered, sensitive data of the domain owner can be seen in the [WHOIS](#whois) registry. Read more [here](#whois-privacy). However, it may not be a good idea to fill in false information during registration for this reason. You may be either automatically or purposely prompted to verify your details, and since you are in breach of the terms of registration, you run the risk of losing your domain. However, you would probably only be prompted to correct the details.

Domains with some TLDs may only be registered for a specific purpose or for persons/organisations based in a specific area, see e.g. [TLD *.us*](https://developers.cloudflare.com/registrar/top-level-domains/us-domains/#registration-requirements-for-us-domains). Failure to do so will result in a breach of the terms of registration, for which the domain may be cancelled.

## Migrating a domain to Cloudflare {#move-to-cloudflare}
After registering a domain, I recommend moving the domain to Cloudflare. It's a simple process (just change the domain nameservers at the registrar; plus the existing DNS records will be automatically created so you don't have to recreate them) that costs nothing.

This step is unnecessary (for exceptions where you are limited by the registrar - e.g. you cannot create an *SRV* record with Freenom). I just personally think that Cloudflare provides a quality service, and moving a domain will bring such a range of benefits where the move is worthwhile.

Cloudflare provides benefits at no charge over many registrars, including:
- friendly administration
- DNS record changes are almost always reflected immediately
- page rules (e.g. the ability to redirect a subdomain (*discord.mydomain.tld*) to a Discord invitation without the need for web hosting)
- the possibility of protection, proxy (= hiding the address of the server on which the page is running)
- website caching and analytics
- possibility to easily create an email address on the domain (only for receiving)

After changing nameservers, you need to wait for the change to take effect. Until the domain is active at Cloudflare, DNS records managed at Cloudflare will have no effect.

You can tell that a domain is active by seeing *✓ Active* in the domain list instead of *Pending Nameserver Update*.

## Domain Setup {#domain-setup}
In order for the domain to work, you need to point the domain to the service. This is done using DNS records that you can create in the domain administration (which is typically at the domain registrar or Cloudflare if you move it there).

In the case where you are using a service provided by someone else, the provider will usually tell you what DNS records to create for the domain to work.

If you manage the service yourself (e.g. on a VPS), it's useful to know the basic types of DNS records. You can read more about them at the following link: <https://www.cloudflare.com/learning/dns/dns-records/>

If such an option exists, it is advisable to use a hostname instead of an IP address for DNS records, as the IP address can change. If the IP address changes, the DNS record(s) would need to be modified. If this is not done, the domain pointing to the old IP address would stop working (and after this change, the address may not work for some users for some time, even if the record points to the correct address, due to [cache](#domain-cache))

## How to set up a domain for a Minecraft server {#domain-minecraft-setup}
To set up a domain to connect to a Minecraft server, just create the DNS record(s) as shown in the image(s) below. The domain name *play* means it will connect via *play.mydomain.tld*. Of course, you can use anything else instead of *play*, such as *mc*, or allow connections via [root-domain](~root-domain) (*mydomain.tld*) instead of [subdomain](~subdomain).

If you are using IPv6, the same applies as for IPv4, just use a record of type *AAAA* instead of *A* records.

### Java {#domain-minecraft-setup-java}
![Domain setup for Minecraft Java Server](/assets/diagrams/domains/javaDomainSetup.png)

#### Pitfalls of using SRV record {#srv-pitfall}
In the case where an SRV record is used to point a domain (= port is not the default, i.e. *25565*), it is important to note that this address is supposed to be used to connect through the Minecraft client only.

The *A*/*CNAME* record is good in that almost any program will translate this record automatically (in the implementation of almost any programming language, the operating system itself will take care of this). However, this is not the case with the *SRV* record. The client must have support for this record manually implemented. This is why, for example, the *SRV* address does not work in the Velocity/BungeeCord config, the browser to look up Dynmap, the Votifier address, or the *ping* command in the command line. In the past, even some unofficial Minecraft clients have had problems with *SRV* records.

So, as mentioned, a custom domain using an *SRV* record is only for connecting players, and if the client/service in question does not have support for the *SRV* record implemented for Minecraft, the domain address will not work.

At the same time, some DNS resolvers (especially the default one from ISPs) may not support *SRV* records.

These are the reasons why, when the server is running on the default port, the *A*/*CNAME* record should be preferred over the *SRV* record.

### Bedrock (Geyser) {#domain-minecraft-setup-bedrock}
![Domain setup for Minecraft Bedrock Server](/assets/diagrams/domains/bedrockDomainSetup.png)

The Bedrock version of the Minecraft client, unlike the Java version, does not support *SRV* records. When connecting, the server address and port are entered separately, so if the connection port for Bedrock is not the default (*19132*), you still need to change the port when connecting.

## How domain works (a.k.a. DNS records) {#how-domains-work}
The principle of how domains work is (simplified) as follows.

As mentioned in the introduction, every service on the Internet runs on an IP address, e.g. `142.251.36.142`.

In order to connect through a domain, a DNS record needs to be created that points to that service.

This record can be created for both [root-domain](~root-domain) and [subdomain](~subdomain).

As shown in the figure below, in simple terms, when a client (Minecraft client, browser) attempts to connect to a domain, it will obtain a DNS record for a specific (sub)domain from which it will determine the address to which it will then attempt to connect.

![How DNS works](/assets/diagrams/domains/dns.png)

So, in principle, domains are used for translation. This implies that the service provider to which the domain points is not related to the domain and therefore has no influence on its functionality (it can have in certain situations, but for example, this is not the case for Minecraft servers).

At the same time, it follows that DNS records are resolved only by the client itself, the server knows nothing about them, and therefore it is useless to restart the service (server) after setting DNS records.

## Domain not working (how to debug a domain that doesn't work) {#domain-debugging}
Before troubleshooting a domain, make sure the service itself is available on the default address.

If you are using <https://mcsrvstat.us> for testing, also test the availability of the server on the default address directly from that page, as the server may not be available directly from that page due to firewall etc.

If the server appears after typing the domain into <https://mcsrvstat.us>, it is almost certainly a problem with the [client cache](#domain-cache). Less often, it's issue with domain propagation, where a particular user's DNS changes may take much longer to propagate than others depending on the DNS resolver they are using, most often due to the cache of the DNS resolver itself.

If the server from <https://mcsrvstat.us> is not available, probably [the changes are not yet propagated fully](#domain-propagation). In this case, just wait. But if that's not the cause, the problem may be [duplicate records](#double-records), or [the client itself has a problem with DNS](#bad-dns-resolvers), or [exceptionally, the domain then has a status that makes the domain unusable](#inactive-domain).

### Domain propagation {#domain-propagation}
Changes to DNS records may not take effect immediately. How long propagation takes usually depends on where you manage the domain. It takes 48 hours for the changes to take effect across the Internet. However, it's usually much sooner for almost all users, at most within hours.

### Cache {#domain-cache}
It may happen that an address works, but a user who tried to connect to it before it worked cannot connect to it. This happens because, in layman's terms, the computer "remembers" that there is nothing on the domain and has this information temporarily stored.

In this case, just wait, or on a Windows operating system, the DNS cache can be cleared by executing `ipconfig /flushdns` at the command prompt.

Not only the operating system itself can have this information cached, but also the client (e.g. Minecraft client or browser). In that case, it is usually enough to restart the client.

### Domain status {#inactive-domain}
A domain may have a status that prevents the domain from functioning. This can happen for a number of reasons, such as non-payment or legal disputes.

You can find out if your domain is in a status that causes the domain to be inactive by using [WHOIS](#whois). Specifically, I recommend this page - <https://who.is/> - where you will find *Status* on the right side, which should be *Active*.

Different status (the technical status of the domain itself in the WHOIS content - "Domain Status: \<status\>", not the *Status* indicator on the *who.is* page, which should be *Active*) than *ok* does not automatically mean the domain is broken. You can learn more about the specific status [here](https://icann.org/epp).

If you encounter a status that affects domain functionality, check your email provided at email registration. You have probably already been contacted by the registrar and asked to take action. If this has not happened, contact the domain registrar.

In the following example, the status [*clientHold*](https://icann.org/epp#clientHold) prevents DNS resolution (which allows the domain to work).

```yaml
Domain Status: clientHold https://icann.org/epp#clientHold
Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited
Domain Status: serverTransferProhibited https://icann.org/epp#serverTransferProhibited
```

### Doubled records {#double-records}
So-called "double-records" are records that have a name like `mydomain.com.mydomain.com`.

This often happens when the DNS record to be created has the name of the domain itself listed next to the *Name* field, while the field is called the same in the domain administration - i.e. *Name* (as shown in the image below), and so the user feels that they should type the name of the domain itself into this field.

![Double name](/assets/domains/double-name.png)

The name of the record itself should be *mydomain.com*. How to create a record for such a root domain (*mydomain.com*) depends on the specific administration where the domain is managed. In the case of the administration in the picture above, the *Name* field should be left blank. If you type `mydomain.com` in the name field, it will create a record called `mydomain.com.mydomain.com`, which you don't want.

So if the field can be left blank and you want to create a record for the root domain, presumably the *Name* field should be left blank and only used when you want to create a DNS record for [subdomain](~subdomain).

### Bad DNS resolvers {#bad-dns-resolvers}
Use of some DNS resolvers - especially the default ones from Internet Service Provider (ISP) - can cause a broken domain for the particular user using those resolvers.

In this case, the solution is to set up better DNS resolvers on the operating system. Examples of these include those from Cloudflare, Google, or OpenDNS.

There are many instructions on how to set up these DNS resolvers.

### Connecting through a domain routed through an SRV record outside of the Minecraft client {#bad-srv-usage}
In the case where you are trying to connect to a domain address that is pointed via *SRV* record outside of the Minecraft client (e.g. to Dynmap address in browser), the Minecraft *SRV* record is probably not supported by the client (for the Dynmap, the client is the browser). In this case, you need to use the default server address. Read more about the cause [here](#srv-pitfall).

## WHOIS {#whois}
WHOIS allows you to find out information about the domain owner and the domain itself (e.g. registration and expiration time).

You can use either generic tools that work for all [TLDs](~tld) (<https://www.whois.com/whois/>, <https://who.is/>) or a WHOIS tool from the [TLD](~tld) administrator itself. For example, for the *.eu* domain, you can find the official WHOIS [here](https://eurid.eu). These WHOIS tools (specific to [TLD](~tld)) may contain more information than generic WHOIS tools.

### Privacy {#whois-privacy}
WHOIS may contain sensitive information about the domain owner.

Usually TLDs like *.com* or *.net* won't expose much private information, however, some regional TLDs expose very sensitive information like first name, last name, e-mail, or even address.

For example, for the *.cz* extension, the first name, last name, and by default the address can be seen (can be seen by clicking on the domain holder or contacting the NSSET technical administrator). The address can be hidden by verifying, but the first and last name cannot.

On the other hand, for the *.eu* extension, the first name, last name and address are not public information, but the same cannot be said for email.

It may not be a good idea to fill in false information when registering for this reason. You may be either automatically or purposely prompted to verify the information, and since you are in violation of the terms of registration, you run the risk of losing your domain. However, you would almost certainly only be prompted to correct the details.

However, there are (Trustee) services where you have full access to the domain, but the domain is officially registered to someone else (a company).

## DNSSEC {#dnssec}
In case you want to protect users (especially on websites, you won't use DNSSEC with Minecraft server) from potential attacks, consider activating DNSSEC. You can read more about DNSSEC here: <https://www.cloudflare.com/dns/dnssec/how-dnssec-works/>

## How to get the IP address of a server {#hostname-to-ip}
How to get the IP address of a server from a hostname can be found [here](../general/address-ports.md#hostname-to-ip).

## Domain Management {#management}
### Domain ownership change {#domain-ownership-transfer}
It should be possible to change the owner of a domain. Check with your registrar (who will probably have an article on this topic on the knowledge base) to find out how to do this.

### Expiration {#expiration}
After a domain expires, the protection period begins, after which it can be extended. After this period, the domain is cancelled and released for registration to others. The length of this period is not universal, it always depends on the domain (ending), as well as the functionality of the domain in the period between expiration and deletion.

For example, for the *cz* TLD, the protection period is 60 days, with the first 30 days being fully functional. For *eu*, the protection period is 40 days and the domain is non-functional for the entire period.

### Canceling a domain {#cancel}
Some domains (TLDs) can be cancelled early, others cannot. In cases where early cancellation is possible, there may be a fee for early cancellation of the domain. This fee again varies depending on the [TLD](~tld).

However, usually you just let the domain expire.

## Other {#other}
A [wildcard record](https://developers.cloudflare.com/dns/manage-dns-records/reference/wildcard-dns-records/) (*\*.domain.tld*) can be created to allow connections via *\<anything>.domain.tld*. This is used by e.g. Hypixel see <https://mcsrvstat.us/server/kl5fd5d1reqh7.hypixel.net>

The domain name may in certain cases contain [diacritics](https://en.wikipedia.org/wiki/IDN), or even an emojis ([Punycode](https://en.wikipedia.org/wiki/Punycode)).

For a complete list of existing [TLDs](~tld), see [here](https://data.iana.org/TLD/tlds-alpha-by-domain.txt). As of 1 January 2024, there are about 1450 of them. However, not all of them can be registered.

Apart from service records (*SRV*), which must be manually implemented by the client itself, DNS records cannot handle ports. So if a service is running on `8.8.8:3000` and you set a DNS record (type *A*) named `domain.tld` pointing to `8.8.8.8`, the service address will be `domain.tld:3000`, there is no way to hide the port.

Some [TLDs](~tld) such as `.dev` prevent accessing the page on *http* (`.dev` is the only common one).

## Terminology {#terminology}
### IP address vs hostname vs custom domain {#address-terminology}
IPv4 - 32-bit IP address, e.g. *192.168.10.150* (no port)

IPv6 - 128-bit IP address, e.g. *2041:0000:140F::875B:131B* (no port)

hostname - the default address of the service in "domain format", e.g. *node.myhost.com* (no port)

(custom) domain - custom domain address, e.g. *play.myserver.com* (no port)

So there is no such thing as a "custom IP address" (meaning domain). There is only an IP(v4/v6) address, hostname, or custom domain (the hostname itself is technically domain too).

### Root domain, subdomain, TLD {#domain-terminology}
Root domain - refers to the domain itself, e.g. *mydomain.com*.

Subdomain - denotes a third level domain or higher, e.g. `subdomain.mydomain.com`, `subdomain.subdomain.mydomain.com`.

TLD - TLD refers to the "extension" - "end" of the domain, i.e. in the domain `mydomain.com` the TLD is `com`