INFRASTRUCTURE_JSON=${CURDIR}/infrastructure.json
STACK_NAME=jekyll-blog

infrastructure: 
	python infrastructure.py > ${INFRASTRUCTURE_JSON}
	aws cloudformation ${MODE}-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://${INFRASTRUCTURE_JSON}
