### MACAD-Agents

Multi-Agent algorithms for Multi-Agent Connected Autonomous Driving using [MACAD-Gym](https://github.com/praveen-palanisamy/macad-gym)

#### How to train/test MACAD-Agents?

0. `git clone https://github.com/praveen-palanisamy/macad-agents`

1. Build the MACAD-Agents Docker container: `docker build --rm -f macad-agents/Dockerfile -t macad-agents:latest .`

2. Run the MACAD-Agents training container:
`bash run.sh`

    You can pick from one of the available multi-agent training options:

    - To train multiple agents using PPO where the agents communicate/share learned weights, modify the last line in `run.sh` to look like this:

      `macad-agents:latest python -m macad_agents.rllib.ppo_multiagent_shared_weights.py`

    - To train multiple agents using IMPALA where the agents communicate/share learned weights, modify the last line in `run.sh` to look like this:
    
      `macad-agents:latest python -m macad_agents.rllib.impala_multiagent_shared_weights.py`

#### Citing

If you find this work or [MACAD-Gym](https://github.com/praveen-palanisamy/macad-gym) useful in your research, please cite:

```bibtex
@misc{palanisamy2019multiagent,
    title={Multi-Agent Connected Autonomous Driving using Deep Reinforcement Learning},
    author={Praveen Palanisamy},
    year={2019},
    eprint={1911.04175},
    archivePrefix={arXiv},
    primaryClass={cs.LG}
}
```

<details><summary>Citation in other Formats: (Click to View)</summary>
<p>
<div id="gs_citt"><table><tbody><tr><th scope="row" class="gs_cith">MLA</th><td><div tabindex="0" class="gs_citr">Palanisamy, Praveen. "Multi-Agent Connected Autonomous Driving using Deep Reinforcement Learning." <i>arXiv preprint arXiv:1911.04175</i> (2019).</div></td></tr><tr><th scope="row" class="gs_cith">APA</th><td><div tabindex="0" class="gs_citr">Palanisamy, P. (2019). Multi-Agent Connected Autonomous Driving using Deep Reinforcement Learning. <i>arXiv preprint arXiv:1911.04175</i>.</div></td></tr><tr><th scope="row" class="gs_cith">Chicago</th><td><div tabindex="0" class="gs_citr">Palanisamy, Praveen. "Multi-Agent Connected Autonomous Driving using Deep Reinforcement Learning." <i>arXiv preprint arXiv:1911.04175</i> (2019).</div></td></tr><tr><th scope="row" class="gs_cith">Harvard</th><td><div tabindex="0" class="gs_citr">Palanisamy, P., 2019. Multi-Agent Connected Autonomous Driving using Deep Reinforcement Learning. <i>arXiv preprint arXiv:1911.04175</i>.</div></td></tr><tr><th scope="row" class="gs_cith">Vancouver</th><td><div tabindex="0" class="gs_citr">Palanisamy P. Multi-Agent Connected Autonomous Driving using Deep Reinforcement Learning. arXiv preprint arXiv:1911.04175. 2019 Nov 11.</div></td></tr></tbody></table></div><div id="gs_citi"><a class="gs_citi" href="https://scholar.googleusercontent.com/scholar.bib?q=info:xm26aHYhVDgJ:scholar.google.com/&amp;output=citation&amp;scisdr=CgXTGHMuEN628ARjSCI:AAGBfm0AAAAAXetmUCK7vBmr1OtOq0KVG6IXDlyHhBdl&amp;scisig=AAGBfm0AAAAAXetmUIGOLisMm--ltk35iSX92VU3dlmg&amp;scisf=4&amp;ct=citation&amp;cd=-1&amp;hl=en">BibTeX</a> <a class="gs_citi" href="https://scholar.googleusercontent.com/scholar.enw?q=info:xm26aHYhVDgJ:scholar.google.com/&amp;output=citation&amp;scisdr=CgXTGHMuEN628ARjSCI:AAGBfm0AAAAAXetmUCK7vBmr1OtOq0KVG6IXDlyHhBdl&amp;scisig=AAGBfm0AAAAAXetmUIGOLisMm--ltk35iSX92VU3dlmg&amp;scisf=3&amp;ct=citation&amp;cd=-1&amp;hl=en">EndNote</a> <a class="gs_citi" href="https://scholar.googleusercontent.com/scholar.ris?q=info:xm26aHYhVDgJ:scholar.google.com/&amp;output=citation&amp;scisdr=CgXTGHMuEN628ARjSCI:AAGBfm0AAAAAXetmUCK7vBmr1OtOq0KVG6IXDlyHhBdl&amp;scisig=AAGBfm0AAAAAXetmUIGOLisMm--ltk35iSX92VU3dlmg&amp;scisf=2&amp;ct=citation&amp;cd=-1&amp;hl=en">RefMan</a> <a class="gs_citi" href="https://scholar.googleusercontent.com/scholar.rfw?q=info:xm26aHYhVDgJ:scholar.google.com/&amp;output=citation&amp;scisdr=CgXTGHMuEN628ARjSCI:AAGBfm0AAAAAXetmUCK7vBmr1OtOq0KVG6IXDlyHhBdl&amp;scisig=AAGBfm0AAAAAXetmUIGOLisMm--ltk35iSX92VU3dlmg&amp;scisf=1&amp;ct=citation&amp;cd=-1&amp;hl=en" target="RefWorksMain">RefWorks</a> </div>
</p>
</details>
