describe('response status is 200', () => {
    it('GET', () => {
        cy.request('GET', 'https://e2m8z6w343.execute-api.eu-west-1.amazonaws.com/')
        .then((res) => {expect(res).to.have.property('status', 200)
        })        
    })
})

describe('response body is not null', () => {
    it('GET', () => {
        cy.request('GET', 'https://e2m8z6w343.execute-api.eu-west-1.amazonaws.com/')
        .then((res) => {expect(res.body).to.not.be.null
        })        
    })
})
