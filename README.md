# Car Parking Lot System 

## PROJENİN TANIMI VE GEREKSİNİM ANALİZİ :computer:
Otopark veritabanı, otoparklarda müşteri ve yöneticiler için kayıt tutan verilere erişmeyi
kolaylaştıran bir sistemdir.Müşterinin otopark bloklarının müsaitliğini, hangi bölümlerde yer 
bulabileceğini, engelliler veya tüplü araçlar için uygun olup olmadığını kolayca 
öğrenebilmesini sağlar. Bu sistemde yönetici ve park görevlileri bulunup kullanıcı için yer 
tainini kolaylaştırır. Otoparkı kampüs,blok,bölge ve bölüm diye 4 kısma ayırdım. Bunları büyük olan 
küçüğü kapsayacak şekilde ilişkilendirdim. Yönetim için yönetici ve park görevlisi tablolarını 
oluşturdum. Bir yönetici bir kampüsten sorumlu iken, park görevlisi bir bloktan sorumludur.İki 
durumda da sınırlı yetkiye sahiptirler.Bir park görevlisi bir bileti düzenlerken,bir yönetici park 
görevlilerini seçebilir.
Müşteri ise bir veya birden çok araca sahip olabilir.Bu araçlara ait bir 
veya birden çok bilet olabilir.
Bu projeyi geliştirirken önce kullanıcılar için gereksinim analizi belirledim. Daha sonra 
bu gereksinim analizinden yola çıkarak iş kurallarını belirledim. Oluşturulan her tablo için 
verileri ve bu tablolar arasındaki ilişkileri belirledim. Chen ve kazayağı modeli oluşturup ER 
diagramda gösterdim.

## İŞ KURALLARI
Otoparkta ,birden çok kampüs olabilir.     

**Kampüs-Blok (1:N)**     
Bir kampüste birden çok blok olabilir.      
Bir blok bir kampüste bulunur.      

**Blok-Kat (1:N)**      
Bir blokta birden çok kat olabilir.    
Bir kat bir blokta bulunur.     

**Kat-Bölüm (1:N)**      
Bir katta birden çok bölüm olabilir.    
Bir bölüm bir katta bulunur.      

**Bölüm-Bölge (1:N)**     
Bir bölümde birden çok bölge olabilir.      
Bir bölge bir bölümdedir.     

**Bölge-Müsaitlik Durumu(1:1)**     
Bir bölge müsaitlik durumu, o zaman içerisinde 1 tanedir.   

**Görevli Blok (1:1)**    
Bir görevli bir bloktan sorumludur.   
Bir bloktan bir görevli sorumludur.     

**Yönetici-Kampüs (1:1)**     
Bir yönetici bir kampüsten sorumludur.    
Bir kampüsten bir yönetici sorumludur.    

**Müşteri-Araç (1:N)**    
Bir müşterinin birden çok aracı olabilir.   
Bir araç bir müşteriye aittir.    

**Bilet-Araç (1:1)**    
Bir bilet bir araca aittir.Bir aracın aynı tarihte ve zamanda bir bileti vardır.      

**Bilet-Ödeme Yöntemi (1:1)**   
Bir bilet bir ödeme yöntemiyle ödenir.    
Bir ödeme yöntemi birden çok bileti ödeyebilir  

<hr>

## DESCRIPTION OF THE PROJECT AND REQUIREMENTS ANALYSIS :computer:
The parking database provides access to data that keeps records for customers and managers in parking lots
it is a system that makes it easier.Availability of parking blocks, in which sections are located customers can find it easily, whether it is suitable for the disabled or scuba diving vehicles. In this system, there are administrators and parking attendants who makes it easy to find a zone for the customers.
I have divided the parking lot into 4 parts called campus, block, region and section. These are the big ones I linked it to cover the small one. I created admin and parking attendant tables for management.While an administrator is in charge of a campus, the parking attendant is in charge of a block.In both cases, the authority is limited.A parking attendant issue a ticket,while an administrator can choose attendants.The customer, on the other hand, may have one or more vehicles.Vehicles may have one or more tickets.When developing this project, I first determined the requirements analysis for users.Later,based on this requirement analysis, I have determined the business rules.For each created table I have select the data and the relationships between these tables I created a chen model and a crows foot model.

## BUSINESS RULES 
In the parking lot,there may be more than one campus.   

**Campus-Block(1:N)**   
A campus can have multiple blocks.    
A block must be located on a campus   

**Block-Floor(1:N)**    
A block can have multiple floors.   
A floor is located on a block.   

**Floor-Section(1:N)**    
A floor can have multiple sections.     
A section is located on a floor.    

**Section-Zone(1:N)**   
A section can have multiple zones.     
A zone is located on a section.   

**Zone-isFine(1:1)**    
A region is either eligible or not.     

**ParkingAttendant-Block(1:1)**   
One parking attendant is responsible for a block.   

**Management-Campus(1:1)**    
One management is responsible for a campus.   

**Customer-Car(1:N)** 
A customer can have multiple cars.  
A car can belongs to a customer.    

**Ticket-Car(1:1)**   
A ticket can belongs to a vehicle.    
A vehicle has a ticket on the same date and time.   

**Ticket-Fee(1:N)**   
A ticket can has one fee. 
