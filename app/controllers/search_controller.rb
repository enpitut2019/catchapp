require 'rexml/document'
# require "google/cloud/translate"

class SearchController < ApplicationController


    def xmlString
        xml_string = <<-EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <feed xmlns="http://www.w3.org/2005/Atom">
      <link href="http://arxiv.org/api/query?search_query%3Dall%3Aelectron%26id_list%3D%26start%3D0%26max_results%3D10" rel="self" type="application/atom+xml"/>
      <title type="html">ArXiv Query: search_query=all:electron&amp;id_list=&amp;start=0&amp;max_results=10</title>
      <id>http://arxiv.org/api/WyBPOs+pRgzCTXTMWhtnbcOmk6g</id>
      <updated>2019-12-10T00:00:00-05:00</updated>
      <opensearch:totalResults xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/">152356</opensearch:totalResults>
      <opensearch:startIndex xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/">0</opensearch:startIndex>
      <opensearch:itemsPerPage xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/">10</opensearch:itemsPerPage>
      <entry>
        <id>http://arxiv.org/abs/cond-mat/0102536v1</id>
        <updated>2001-02-28T20:12:09Z</updated>
        <published>2001-02-28T20:12:09Z</published>
        <title>Impact of Electron-Electron Cusp on Configuration Interaction Energies</title>
        <summary>  The effect of the electron-electron cusp on the convergence of configuration
    interaction (CI) wave functions is examined. By analogy with the
    pseudopotential approach for electron-ion interactions, an effective
    electron-electron interaction is developed which closely reproduces the
    scattering of the Coulomb interaction but is smooth and finite at zero
    electron-electron separation. The exact many-electron wave function for this
    smooth effective interaction has no cusp at zero electron-electron separation.
    We perform CI and quantum Monte Carlo calculations for He and Be atoms, both
    with the Coulomb electron-electron interaction and with the smooth effective
    electron-electron interaction. We find that convergence of the CI expansion of
    the wave function for the smooth electron-electron interaction is not
    significantly improved compared with that for the divergent Coulomb interaction
    for energy differences on the order of 1 mHartree. This shows that, contrary to
    popular belief, description of the electron-electron cusp is not a limiting
    factor, to within chemical accuracy, for CI calculations.
    </summary>
        <author>
          <name>David Prendergast</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">Department of Physics</arxiv:affiliation>
        </author>
        <author>
          <name>M. Nolan</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">NMRC, University College, Cork, Ireland</arxiv:affiliation>
        </author>
        <author>
          <name>Claudia Filippi</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">Department of Physics</arxiv:affiliation>
        </author>
        <author>
          <name>Stephen Fahy</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">Department of Physics</arxiv:affiliation>
        </author>
        <author>
          <name>J. C. Greer</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">NMRC, University College, Cork, Ireland</arxiv:affiliation>
        </author>
        <arxiv:doi xmlns:arxiv="http://arxiv.org/schemas/atom">10.1063/1.1383585</arxiv:doi>
        <link title="doi" href="http://dx.doi.org/10.1063/1.1383585" rel="related"/>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">11 pages, 6 figures, 3 tables, LaTeX209, submitted to The Journal of
      Chemical Physics</arxiv:comment>
        <arxiv:journal_ref xmlns:arxiv="http://arxiv.org/schemas/atom">J. Chem. Phys. 115, 1626 (2001)</arxiv:journal_ref>
        <link href="http://arxiv.org/abs/cond-mat/0102536v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/cond-mat/0102536v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/astro-ph/0608371v1</id>
        <updated>2006-08-17T14:05:46Z</updated>
        <published>2006-08-17T14:05:46Z</published>
        <title>Electron thermal conductivity owing to collisions between degenerate
      electrons</title>
        <summary>  We calculate the thermal conductivity of electrons produced by
    electron-electron Coulomb scattering in a strongly degenerate electron gas
    taking into account the Landau damping of transverse plasmons. The Landau
    damping strongly reduces this conductivity in the domain of ultrarelativistic
    electrons at temperatures below the electron plasma temperature. In the inner
    crust of a neutron star at temperatures T &lt; 1e7 K this thermal conductivity
    completely dominates over the electron conductivity due to electron-ion
    (electron-phonon) scattering and becomes competitive with the the electron
    conductivity due to scattering of electrons by impurity ions.
    </summary>
        <author>
          <name>P. S. Shternin</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">Ioffe Physico-Technical Institute</arxiv:affiliation>
        </author>
        <author>
          <name>D. G. Yakovlev</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">Ioffe Physico-Technical Institute</arxiv:affiliation>
        </author>
        <arxiv:doi xmlns:arxiv="http://arxiv.org/schemas/atom">10.1103/PhysRevD.74.043004</arxiv:doi>
        <link title="doi" href="http://dx.doi.org/10.1103/PhysRevD.74.043004" rel="related"/>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">8 pages, 3 figures</arxiv:comment>
        <arxiv:journal_ref xmlns:arxiv="http://arxiv.org/schemas/atom">Phys.Rev. D74 (2006) 043004</arxiv:journal_ref>
        <link href="http://arxiv.org/abs/astro-ph/0608371v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/astro-ph/0608371v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="astro-ph" scheme="http://arxiv.org/schemas/atom"/>
        <category term="astro-ph" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/1802.06593v1</id>
        <updated>2018-02-19T11:51:42Z</updated>
        <published>2018-02-19T11:51:42Z</published>
        <title>Electron pairing: from metastable electron pair to bipolaron</title>
        <summary>  Starting from the shell structure in atoms and the significant correlation
    within electron pairs, we distinguish the exchange-correlation effects between
    two electrons of opposite spins occupying the same orbital from the average
    correlation among many electrons in a crystal. In the periodic potential of the
    crystal with lattice constant larger than the effective Bohr radius of the
    valence electrons, these correlated electron pairs can form a metastable energy
    band above the corresponding single-electron band separated by an energy gap.
    In order to determine if these metastable electron pairs can be stabilized, we
    calculate the many-electron exchange-correlation renormalization and the
    polaron correction to the two-band system with single electrons and electron
    pairs. We find that the electron-phonon interaction is essential to
    counterbalance the Coulomb repulsion and to stabilize the electron pairs. The
    interplay of the electron-electron and electron-phonon interactions, manifested
    in the exchange-correlation energies, polaron effects, and screening, is
    responsible for the formation of electron pairs (bipolarons) that are located
    on the Fermi surface of the single-electron band.
    </summary>
        <author>
          <name>Guo-Qiang Hai</name>
        </author>
        <author>
          <name>Ladir Cândido</name>
        </author>
        <author>
          <name>Braulio G. A. Brito</name>
        </author>
        <author>
          <name>François M. Peeters</name>
        </author>
        <arxiv:doi xmlns:arxiv="http://arxiv.org/schemas/atom">10.1088/2399-6528/aaaee0</arxiv:doi>
        <link title="doi" href="http://dx.doi.org/10.1088/2399-6528/aaaee0" rel="related"/>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">17 pages, 6 figures, Journal of Physics Communications 2018</arxiv:comment>
        <link href="http://arxiv.org/abs/1802.06593v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/1802.06593v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/1501.04914v1</id>
        <updated>2015-01-20T18:48:22Z</updated>
        <published>2015-01-20T18:48:22Z</published>
        <title>Hamiltonian of a many-electron system with single-electron and
      electron-pair states in a two-dimensional periodic potential</title>
        <summary>  Based on the metastable electron-pair energy band in a two-dimensional (2D)
    periodic potential obtained previously by Hai and Castelano [J. Phys.: Condens.
    Matter 26, 115502 (2014)], we present in this work a Hamiltonian of many
    electrons consisting of single electrons and electron pairs in the 2D system.
    The electron-pair states are metastable of energies higher than those of the
    single-electron states at low electron density. We assume two different
    scenarios for the single-electron band. When it is considered as the lowest
    conduction band of a crystal, we compare the obtained Hamiltonian with the
    phenomenological model Hamiltonian of a boson-fermion mixture proposed by
    Friedberg and Lee [Phys. Rev. B 40, 6745 (1989)]. Single-electron-electron-pair
    and electron-pair-electron-pair interaction terms appear in our Hamiltonian and
    the interaction potentials can be determined from the electron-electron Coulomb
    interactions. When we consider the single-electron band as the highest valence
    band of a crystal, we show that holes in this valence band are important for
    stabilization of the electron-pair states in the system.
    </summary>
        <author>
          <name>G. -Q. Hai</name>
        </author>
        <author>
          <name>F. M. Peeters</name>
        </author>
        <arxiv:doi xmlns:arxiv="http://arxiv.org/schemas/atom">10.1140/epjb/e2014-50686-x</arxiv:doi>
        <link title="doi" href="http://dx.doi.org/10.1140/epjb/e2014-50686-x" rel="related"/>
        <arxiv:journal_ref xmlns:arxiv="http://arxiv.org/schemas/atom">Eur. Phys. J. B (2015) 88: 20</arxiv:journal_ref>
        <link href="http://arxiv.org/abs/1501.04914v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/1501.04914v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="cond-mat.supr-con" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.supr-con" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.mes-hall" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/0707.4225v1</id>
        <updated>2007-07-28T09:32:22Z</updated>
        <published>2007-07-28T09:32:22Z</published>
        <title>Electron-Electron Bremsstrahlung Emission and the Inference of Electron
      Flux Spectra in Solar Flares</title>
        <summary>  Although both electron-ion and electron-electron bremsstrahlung contribute to
    the hard X-ray emission from solar flares, the latter is normally ignored. Such
    an omission is not justified at electron (and photon) energies above $\sim 300$
    keV, and inclusion of the additional electron-electron bremsstrahlung in
    general makes the electron spectrum required to produce a given hard X-ray
    spectrum steeper at high energies.
      Unlike electron-ion bremsstrahlung, electron-electron bremsstrahlung cannot
    produce photons of all energies up to the maximum electron energy involved. The
    maximum possible photon energy depends on the angle between the direction of
    the emitting electron and the emitted photon, and this suggests a diagnostic
    for an upper cutoff energy and/or for the degree of beaming of the accelerated
    electrons.
      We analyze the large event of January 17, 2005 observed by RHESSI and show
    that the upward break around 400 keV in the observed hard X-ray spectrum is
    naturally accounted for by the inclusion of electron-electron bremsstrahlung.
    Indeed, the mean source electron spectrum recovered through a regularized
    inversion of the hard X-ray spectrum, using a cross-section that includes both
    electron-ion and electron-electron terms, has a relatively constant spectral
    index $\delta$ over the range from electron kinetic energy $E = 200$ keV to $E
    = 1$ MeV. However, the level of detail discernible in the recovered electron
    spectrum is not sufficient to determine whether or not any upper cutoff energy
    exists.
    </summary>
        <author>
          <name>Eduard P. Kontar</name>
        </author>
        <author>
          <name>A. Gordon Emslie</name>
        </author>
        <author>
          <name>Anna Maria Massone</name>
        </author>
        <author>
          <name>Michele Piana</name>
        </author>
        <author>
          <name>John C. Brown</name>
        </author>
        <author>
          <name>Marco Prato</name>
        </author>
        <arxiv:doi xmlns:arxiv="http://arxiv.org/schemas/atom">10.1086/521977</arxiv:doi>
        <link title="doi" href="http://dx.doi.org/10.1086/521977" rel="related"/>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">7 pages, 5 figures, submitted to Astrophysical Journal</arxiv:comment>
        <link href="http://arxiv.org/abs/0707.4225v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/0707.4225v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="astro-ph" scheme="http://arxiv.org/schemas/atom"/>
        <category term="astro-ph" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/astro-ph/9904306v1</id>
        <updated>1999-04-22T15:54:59Z</updated>
        <published>1999-04-22T15:54:59Z</published>
        <title>Improved scenario of baryogenesis</title>
        <summary>  It is assumed that, in the primordial plasma, at the temperatures above the
    mass of electron, fermions are in the neutral state being the superposition of
    particle and antiparticle. There exists neutral proton-electron symmetry.
    Proton-electron equilibrium is defined by the proton-electron mass difference.
    At the temperature equal to the mass of electron, pairs of neutral electrons
    annihilate into photons, and pairs of neutral protons and electrons survive as
    protons and electrons.
    </summary>
        <author>
          <name>D. L. Khokhlov</name>
        </author>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">3 pages LaTeX</arxiv:comment>
        <link href="http://arxiv.org/abs/astro-ph/9904306v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/astro-ph/9904306v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="astro-ph" scheme="http://arxiv.org/schemas/atom"/>
        <category term="astro-ph" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/cond-mat/0310615v1</id>
        <updated>2003-10-27T08:59:02Z</updated>
        <published>2003-10-27T08:59:02Z</published>
        <title>Exact Electron-Pairing Ground States of Tight-Binding Models with Local
      Attractive Interactions</title>
        <summary>  We present a class of exactly solvable models of correlated electrons. The
    models are defined in any dimension $d$ and consist of electron-hopping terms
    and local attractive interactions between electrons. For each even number of
    electrons less than or equal to $1/(d+1)$-filling, we find the exact ground
    state in which all electrons form pairs of a certain type, and thus the models
    exhibit an electron-pair condensation.
    </summary>
        <author>
          <name>Akinori Tanaka</name>
        </author>
        <arxiv:doi xmlns:arxiv="http://arxiv.org/schemas/atom">10.1143/JPSJ.73.1107</arxiv:doi>
        <link title="doi" href="http://dx.doi.org/10.1143/JPSJ.73.1107" rel="related"/>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">4 pages, 1 figure</arxiv:comment>
        <link href="http://arxiv.org/abs/cond-mat/0310615v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/cond-mat/0310615v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/cond-mat/0205001v1</id>
        <updated>2002-04-30T20:00:18Z</updated>
        <published>2002-04-30T20:00:18Z</published>
        <title>Electron-electron interactions in a weakly screened two-dimensional
      electron system</title>
        <summary>  We probe the strength of electron-electron interactions using
    magnetoconductivity measurements of two-dimensional non-degenerate electrons on
    liquid helium at 1.22 K. Our data extend to electron densities that are two
    orders of magnitude smaller than previously reported. We span both the
    independent-electron regime where the data are qualitatively described by the
    self-consistent Born approximation (SCBA), and the strongly-interacting
    electron regime. At finite fields we observe a crossover from SCBA to Drude
    theory as a function of electron density.
    </summary>
        <author>
          <name>I. Karakurt</name>
        </author>
        <author>
          <name>A. J. Dahm</name>
        </author>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">4 pages, 5 figures</arxiv:comment>
        <link href="http://arxiv.org/abs/cond-mat/0205001v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/cond-mat/0205001v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/1910.13505v1</id>
        <updated>2019-10-29T20:00:05Z</updated>
        <published>2019-10-29T20:00:05Z</published>
        <title>Correlations Between Conduction Electrons in Dense Plasmas</title>
        <summary>  Most treatments of electron-electron correlations in dense plasmas either
    ignore them entirely (random phase approximation) or neglect the role of ions
    (jellium approximation). In this work, we go beyond both these approximations
    to derive a new formula for the electron-electron static structure factor which
    properly accounts for the contributions of both ionic structure and
    quantum-mechanical dynamic response in the electrons. The result can be viewed
    as a natural extension of the quantum Ornstein-Zernike theory of ionic and
    electronic correlations, and it is suitable for dense plasmas in which the ions
    are classical and the conduction electrons are quantum-mechanical. The
    corresponding electron-electron pair distribution functions are compared with
    the results of path integral Monte Carlo simulations, showing good agreement
    whenever no strong electron resonance states are present. We construct
    approximate potentials of mean force which describe the effective screened
    interaction between electrons. Significant deviations from Debye-H\"uckel
    screening are present at temperatures and densities relevant to high energy
    density experiments involving warm and hot dense plasmas. The presence of
    correlations between conduction electrons is likely to influence the
    electron-electron contribution to the electron and thermal conductivity. It is
    expected that excitation processes involving the conduction electrons (e.g.,
    free-free absorption) will also be affected.
    </summary>
        <author>
          <name>Nathaniel R. Shaffer</name>
        </author>
        <author>
          <name>Charles E. Starrett</name>
        </author>
        <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">10 pages, 4 figures</arxiv:comment>
        <link href="http://arxiv.org/abs/1910.13505v1" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/1910.13505v1" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="physics.plasm-ph" scheme="http://arxiv.org/schemas/atom"/>
        <category term="physics.plasm-ph" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
      <entry>
        <id>http://arxiv.org/abs/1403.5117v2</id>
        <updated>2014-04-03T18:29:50Z</updated>
        <published>2014-03-20T12:47:57Z</published>
        <title>Free-electron properties of metals under ultrafast laser-induced
      electron-phonon nonequilibrium: A first-principles study</title>
        <summary>  The electronic behavior of various solid metals (Al, Ni, Cu, Au, Ti, and W)
    under ultrashort laser irradiation is investigated by means of density
    functional theory. Successive stages of extreme nonequilibrium on picosecond
    time scale impact the excited material properties in terms of optical coupling
    and transport characteristics. As these are generally modelled based on the
    free-electron classical theory, the free-electron number is a key parameter.
    However, this parameter remains unclearly defined and dependencies on the
    electronic temperature are not considered. Here, from first-principles
    calculations, density of states are obtained with respect to electronic
    temperatures varying from 10^-2 to 10^5 K within a cold lattice. Based on the
    concept of localized or delocalized electronic states, temperature dependent
    free-electron numbers are evaluated for a series of metals covering a large
    range of electronic configurations. With the increase of the electronic
    temperature we observe strong adjustments of the electronic structures of
    transition metals. These are related to variations of electronic occupation in
    localized d bands, via change in electronic screening and electron-ion
    effective potential. The electronic temperature dependence of nonequilibrium
    density of states has consequences on electronic chemical potentials,
    free-electron numbers, electronic heat capacities, and electronic pressures.
    Thus electronic thermodynamic properties are computed and discussed, serving as
    a base to derive energetic and transport properties allowing the description of
    excitation and relaxation phenomena caused by rapid laser action.
    </summary>
        <author>
          <name>Emile Bévillon</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">LHC</arxiv:affiliation>
        </author>
        <author>
          <name>Jean-Philippe Colombier</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">LHC</arxiv:affiliation>
        </author>
        <author>
          <name>Vanina Recoules</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">DPTA</arxiv:affiliation>
        </author>
        <author>
          <name>Razvan Stoian</name>
          <arxiv:affiliation xmlns:arxiv="http://arxiv.org/schemas/atom">LHC</arxiv:affiliation>
        </author>
        <arxiv:doi xmlns:arxiv="http://arxiv.org/schemas/atom">10.1103/PhysRevB.89.115117</arxiv:doi>
        <link title="doi" href="http://dx.doi.org/10.1103/PhysRevB.89.115117" rel="related"/>
        <arxiv:journal_ref xmlns:arxiv="http://arxiv.org/schemas/atom">Physical Review B (Condensed Matter) 89 (2014) 115117</arxiv:journal_ref>
        <link href="http://arxiv.org/abs/1403.5117v2" rel="alternate" type="text/html"/>
        <link title="pdf" href="http://arxiv.org/pdf/1403.5117v2" rel="related" type="application/pdf"/>
        <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="cond-mat.mtrl-sci" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.mtrl-sci" scheme="http://arxiv.org/schemas/atom"/>
        <category term="cond-mat.str-el" scheme="http://arxiv.org/schemas/atom"/>
      </entry>
    </feed>
EOS
    end

    def parseXML()
        doc = REXML::Document.new(self.xmlString)
        doc.elements.each('//entry') do |e|
            title = e.elements['title'] ? e.elements['title'].text : ''
            aixiv_id = e.elements['id'] ? e.elements['id'].text : ''
            abstract = e.elements['summary'] ? e.elements['summary'].text : ''
            url = e.elements['link[@type="text/html"]'] ? e.elements['link[@type="text/html"]'].attributes['href'] : ''
            url_pdf = e.elements['link[@type="application/pdf"]'] ? e.elements['link[@type="application/pdf"]'].attributes['href'] : ''
            published_at = e.elements['published'] ? e.elements['published'].text : ''
            journal = e.elements['arxiv:journal_ref'] ? e.elements['arxiv:journal_ref'].text : ''
            authors = e.elements.each('author') do |authors_elements|
                author = authors_elements.elements['name'] ? authors_elements.elements['name'].text : ''
                puts "author => #{author}"
            end
            puts "title => #{title}"
            puts "aixiv_id => #{aixiv_id}"
            puts "abstract => #{abstract}"
            puts "url => #{url}"
            puts "url_pdf => #{url_pdf}"
            puts "published_at => #{published_at}"
            puts "journal => #{journal}"
            puts "#######################"
        end
    end
end
