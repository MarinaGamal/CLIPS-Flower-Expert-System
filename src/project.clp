(deftemplate size (slot value))
(deftemplate height (slot h))
(deftemplate season (slot s))
(deftemplate color(slot c))
(deftemplate roottype(slot r))
(deftemplate flowername(multislot name))
(deftemplate perfumed(slot p))
(deftemplate lifecycle (slot duration))
(deftemplate lifetype (slot type))
(deftemplate Soil (slot soil))

(defrule smallSize  "rule 1 size in cm"
(size (value ?x)) (test(> ?x 10)) (test(< ?x 50)) => (assert (height (h small))))
(defrule medSize "rule 2 size in cm"
(size (value ?x)) (test(> ?x 50)) (test(< ?x 150)) => (assert (height (h medium))))
(defrule tallSize " rule 4  size in cm"
(size (value ?x)) (test(> ?x 150)) => (assert (height (h tall))))

(defrule annualflower " rule 5 life cycle in years"
(lifecycle (duration ?x)) (test(= ?x 1)) => (assert (lifetype (type annual))))
(defrule perennialflower " rule 6 life cycle in years"
(lifecycle (duration ?x)) (test(> ?x 1)) => (assert (lifetype (type perennial))))

(defrule irisrule " rule 7 iris flower name"
(season (s summer)) 
(or 
		(color(c blue))
		(color (c yellow))	
		(color (c purple)))
		(lifetype (type perennial)) (roottype (r bulb)) => (assert (flowername (name iris))))
		  
(defrule anemoneflower "rule 8"
(season (s autumn)) 
(or 
		(color(c white))
		(color (c pink))
		(color (c pinkish-red))) => (assert (flowername (name anemone))))
		
		
(defrule Chrysanthemum "rule 9"
(season (s autumn)) 
(height (h medium))
(or 
		(color(c white))
		(color (c purple))
		(color (c red))) => (assert (flowername (name Chrysanthemum))))
		
		
(defrule Freesia "rule 10"
(season (s spring)) 
(roottype (r bulb))
(or 
		(color(c white))
		(color (c yellow))
		(color (c orange))
		(color(c purple))
		(color (c red))
		(color (c blue))
		(perfumed (p true))) => (assert (flowername (name Freesia))))
		
(defrule Dahlia "rule 11"
(lifetype (type perennial))(height (h tall))(roottype (r bulb))(season (s summer)) => (assert(flowername (name Dahlia))))

(defrule Narcissus "rule 12"		
(season (s spring))(roottype (r bulb))(or (color (c yellow))(color (c white))) => (assert(flowername (name Narcissus))))

(defrule Camellia "rule 13"
(Soil (soil acidic)) 
(or
	(color (c white))
	(color (c pink))
	(color (c red)))(lifetype(type perennial))(roottype (r root)) =>(assert(flowername (name Camellia))) )
	
(defrule Lily "rule 14"
(season (s spring))(roottype (r bulb))(perfumed (p true))(height (h small))(lifetype(type perennial)) => (assert(flowername (name Lily))))

(defrule Begonia "rule 15"
(height (h small))(lifetype (type annual))
(or 
	(Soil (soil rich))
	(Soil (soil loose))
	(Soil (soil fertile))) => (assert(flowername(name Begonia))))
	
(defrule Azalea "rule 16"
(season (s winter))
(or
	(color (c white))
	(color (c pink))
	(color (c red))) =>(assert(flowername(name Azalea))))
	
(defrule Anemone "rule 17"
(lifetype (type perennial))(roottype(r root))
(or 
	(color (c white))
	(color (c red))
	(color (c blue))
	(color (c yellow))) => (assert(flowername(name Anemone))))
	
(defrule rose "rule 18"
(lifetype (type perennial))(roottype(r root))
(or
	(color (c white))
	(color (c pink))
	(color (c red))
	(color (c yellow)))(perfumed(p true))(Soil (soil welldrained)) =>(assert(flowername(name rose))))
	
(defrule lily "rule 19"
(flowername(name Lily))(perfumed(p true)) =>(assert(flowername(name White Lily))))	
		

		
		
		  